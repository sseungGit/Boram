<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>reserve_credit</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
	
</head>
<style>
    body{
        background: #f5f5f5;
    }
    span{
        font-size: x-large;
    }
    p{
        font-size: large;
        font-weight: bold;
        margin-bottom: 30px;
        margin-top: 30px;
    }
    .step{
        margin-bottom: 50px;
    }
    .container{
        height: 1000px !important;
        background: #f5f5f5;
        margin-bottom: 320px;
    }
    .addr{
        margin-bottom: 30px;
    }
    #selectPay_transpay p{
        margin: 10px 10px 10px 35px;
    }
    #selectPay_transpay img{
        margin-bottom: 10px;
    }
    #postcode{
        width: 200px;
        display: inline-block;
        margin-bottom: 10px;
    }
    #address{
        width: 405px;
        margin-bottom: -15px;
    }
    #detailAddress{
        width: 200px;
        display: inline;
    }
    #extraAddress{
        display: inline;
        width: 200px;
    }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$(document).ready(function(){
	
		var name = '${param.name}';// 이게 폼안에 안적혀있어서 안 넘어가는 것 같아요...
		var price = '${param.price}'; // 인풋 하이든 만들어서 값 넣고 넘길까요?
		var count = '${param.count}';
		var date = '${param.date}';
		var number = '${param.number}'; // 요게 겓 파라미터 el 로 받아온 거에요 이 값을 결제하기 버튼 눌렀을때 가는 controller 까지 옮겨주세요 네

		//제품 수량에 따른 가격
		var productTotPrice =  new Array();
		
		var n = name.split('/');
		var p = price.split('/');
		var c = count.split('/');
		var d = date.split('/');
		var e = number.split('/'); // 이거랑
		//전체 가격
		var tot = 0;
		
		//Ex 이런식으로 값 화면에 뿌리기
		//$('.'+getId).text(testtt);
		
		// 상품, 수량
		var productName ='';
		var productDate =d[1]+'년 '+d[2]+'월 '+d[3].substr(0, 2)+'일 '+d[3].substr(3, 7);
		
		//상품
		var product ='';
		var count ='';
		var inum =''; // 이거랑
		
		for(var i = 1; i < n.length; i++){
			productTotPrice[i] = parseInt(p[i]) * parseInt(c[i]);
			tot += parseInt(p[i]) * parseInt(c[i]);
			if(i==1){
				productName += n[i]+' '+c[i]+'개';
				product += n[i];
				count += c[i];
				inum += e[i]; // 이거랑
			}else{
				productName += ', '+n[i]+' '+c[i]+'개';
				product += ', '+n[i];
				count += ', '+c[i];
				inum += ', '+e[i]; //이거랑
			}
		}
		$('#count').val(count);
		$('#product').val(product);
		$('#productcount').val(productName);
		$('#reservation_date').val(productDate);
		
		$('#order_price').val(tot);

		$('#inum').val(number) 
		
		document.querySelector("#newAddr").addEventListener("submit", function(event){
		
		//폼 전체의 유효성 여부
		//and 연상자 이용
		let isFormValid = isNameValid && isIdValid && isPwdValid && isEmailValid && isPhoneValid && isAddrValid01 && isAddrValid02;
		if(!isFormValid){
			//폼 제출 막기 
			//기본 동작을 막는 함수
			event.preventDefault();
		}
		let postcode=document.querySelector("#postcode").value;
		let addr=document.querySelector("#addr").value;
		let detailAddr=document.querySelector("#detailAddr").value;
		let extraAddr=document.querySelector("#extraAddr").value;
		let totalAddr=document.querySelector("#totalAddr");
		totalAddr.value=postcode+"_"+addr+"_"+detailAddr+"_"+extraAddr;
	});
		
		
		
        /*  배송지 선택 코드  */

        $('#selectAddr_newAddr').hide(); // 초기값 설정
		
        $("input[name='addr']").change(function(){
            // 기존 배송지 선택시.
            if($("input[name='addr']:checked").val() == '기존배송지'){
                $('#selectAddr_newAddr').hide();
                $('#selectAddr_curAddr').show();
            }
            // 신규 배송지 선택시.
            else if($("input[name='addr']:checked").val() == '신규배송지'){
                $('#selectAddr_curAddr').hide();
                $('#selectAddr_newAddr').show();
            }
        });
        /*  결제 방법 선택 코드  */
        
        $('#selectPay_transpay').hide();   // 초깃값 설정
        $('#selectPay_noBank').hide();	// 초깃값 설정
            
        $("input[name='payment']").change(function(){
            // 현장결제 선택 시.
            if($("input[name='payment']:checked").val() == '현장결제'){
                $('#selectPay_transpay').hide();
                $('#selectPay_noBank').hide();
                $('#selectPay_current').show();
            }	
            // 무통장입금 결제 선택 시.
            else if($("input[name='payment']:checked").val() == '무통장입금'){
                $('#selectPay_transpay').hide();
                $('#selectPay_current').hide();
                $('#selectPay_noBank').show();
            }
            // 계좌이체 결제 선택 시.
            else if($("input[name='payment']:checked").val() == 'QR코드결제'){
                $('#selectPay_current').hide();
                $('#selectPay_noBank').hide();
                $('#selectPay_transpay').show();
            }
        });     
       
    });
    

        /* 결제버튼 누를시 이매일입력 & 신규 주소 입력확인 */
        
    function creditComplete() {
        var email =document.emailForm.username.value;
        var addr1 = document.addrForm.useraddr1.value;
        var addr2 = document.addrForm.useraddr2.value;
        var addr3 = document.addrForm.useraddr3.value;
        var addr4 = document.addrForm.useraddr4.value;
        if(email==""){
            alert("이매일 입력하세요.");       
            return;
            /* 이매일 표현 정규식 추가 할것 */
        }else if($("input[name='addr']:checked").val() == '신규배송지' && addr1=="" && addr2=="" && addr3=="" && addr4==""){
            alert("주소입력 확인해주세요.");
            return;

        }else if(email!="" && $("input[name='addr']:checked").val() == '기존배송지'){
            alert("결제완료");
            /* 
            1. 메인페이지로 보낼지
            2. 마이페이지 보낼지 
            */
        }else if(email!="" && $("input[name='addr']:checked").val() == '신규배송지' && addr1!="" && addr2!="" && addr3!="" && addr4!=""){
            alert("결제완료");
            /* 
            1. 메인페이지로 보낼지
            2. 마이페이지 보낼지 
            */
        }
    };


        
        // $('#creditEmail').keypress(function (e) {
        //     if (e.which == 13) {
        //         $re=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        //         if($(this).val()=='' || $(this).val().length<6 || !$re.test($(this).val())) {
        //             alert('이매일 형식을 확인하세요');
        //         }
        //         else {
        //             alert("결제완료");
        //         }
        //     }
        // });
        //   //첫번째 input박스에 대한 액션
        //   $('#emailCredit').keypress(function (e) {
        //     if (e.which == 13) {
        //         if($('#emailCredit').val()=='') {
        //             alert('이매일 결제 내용을 입력하세요');
        //         }
        //         else {
        //             alert('결제완료');
        //         }
        //     }
        // });
        
        // if($("#creidtEmail[document_type]").val() == ''){
        //     alert("결제이매일 정보를 입력해주세요");
        // }
     
  


    

</script>
<body>
<jsp:include page="/include/nav.jsp"></jsp:include>
<jsp:include page="/include/subnav.jsp">
      <jsp:param value="guide" name="thisPage"/>
      <jsp:param value="area" name="subPage"/>
</jsp:include>
<form action="insert.do" method="post" id="insertForm">
    <div class="container">
        <!-- 배송지 정보 -->
        <div class="addrForm">
            <div class="step">
                <span>Step04 결제창</span>
            </div>
            <div class="product">
                <p>상품정보</p>
                <div>
                	<label for="title" class="form-label">주문자 아이디</label>
                 	<input type="text" class="form-control" name="orderer" id="orderer" value="${id}" readonly/>
                </div>
                <div>
                	<label for="title" class="form-label">상품, 수량</label>
                 	<input type="text" class="form-control" name="productcount" id="productcount" value="" readonly/>
                </div>
                <div>
                	<label for="title" class="form-label">총 주문가격</label>
                 	<input type="text" class="form-control" name="order_price" id="order_price" value="" readonly>
                </div>
                <div>
                	<label for="title" class="form-label">수거날짜</label>
                 	<input type="text" class="form-control" name="reservation_date" id="reservation_date" value="" readonly>
                </div>
                <!-- 주소 -->
            </div>
            <div class="addr">
                <p>배송지정보</p>   
                <!-- 1. 주소 입력 api 적용-->
                <div class=" form-check-inline">
                    <input class="form-check-input" type="radio" name="order_addr" value="기존배송지" checked>
                    <label class="form-check-label" for="addr">
                    기존배송지
                    </label><br>
                </div>
                <div class=" form-check-inline">
                    <input class="form-check-input" type="radio" name="addr" value="신규배송지">
                    <label class="form-check-label" for="addr">
                    신규배송지
                    </label>
                </div><br> 
                <div id="selectAddr_curAddr"><br>
                    <label for="staticAddr" >주소</label><br>
                    <input type="text" class="form-control" name="addr1" id="addr" value="${dto.addr}" readonly>
                </div><br>
                <div id="selectAddr_newAddr">
                        <input type="text" name="useraddr1" id="postcode" placeholder="우편번호" class="form-control" readonly>
                        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-primary"><br>
                        <input type="text" name="useraddr2" id="address" placeholder="주소" class="form-control" readonly><br>
                        <input type="text" name="useraddr3" id="detailAddress" placeholder="상세주소" class="form-control">
                        <input type="text" name="useraddr4" id="extraAddress" placeholder="참고항목" class="form-control" readonly>  
                        <input type="hidden" name="addr" id="totalAddr">  
                              
                </div>
            </div> 
                <!--    
                    2 .이 부분에다가 라디오 버튼의 선택결과 유무에 따라서 
                    기존 배송지폼을 DB에서 전송받거나 신규배송지폼을 제공한다.
                -->
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">요청사항</label>
                <textarea class="form-control" name="request" id="request" rows="3" placeholder="요청사항을 직접 입력합니다.(최대 200자)"></textarea>
            </div>  
        </div>
        <!-- 결제 수단 -->
        <div class="creditForm">
            <div class="credit">
                <p>결제수단</p>
                <div class=" form-check-inline">
                    <input class="form-check-input" type="radio" name="payment" value="현장결제" checked>
                    <label class="form-check-label" for="payment">
                    현장결제
                    </label>
                </div>
                <div class=" form-check-inline">
                    <input class="form-check-input" type="radio" name="payment" value="무통장입금">
                    <label class="form-check-label" for="payment">
                    무통장입금
                    </label>
                </div>
                <div class=" form-check-inline">
                    <input class="form-check-input" type="radio" name="payment" value="QR코드결제">
                    <label class="form-check-label" for="payment">
                    큐알코드
                    </label>
                </div>
            </div>
            <div id="selectPay_current">
                <p>2022년 9월 28일에 현장결제로 선택하셨습니다</p>
            </div>
            <div id="selectPay_noBank">
                <p>가상 계좌 : 12345678-876-123456 (보람은행)</p>
            </div>
            <div id="selectPay_transpay">
                <p>QR코드</p>
                <img src="${pageContext.request.contextPath}/reserve_img/kakaoQR.png" alt="카카오페이 홈페이지 연결" width="10%">
            </div>
                <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">결제 정보 이매일</label>
                        <input type="email" class="form-control" id="creditEmail" name="username" placeholder="Laundry@naver.com">
                </div>
        			<div class="creditBtn">
        				<button class="btn btn-outline-primary" id="newAddr" onclick="creditComplete()" type="submit" style="margin-top: 30px;">결제하기</button>
    				</div>
    				<input type="hidden" name="count" id="count" value="${param.count}"/>
    				<input type="hidden" name="product" id="product" value="${param.name}"/>
    				<input type="hidden" name="inum" id="inum" value="${param.number}"/> 
        	</div>
    	</div>   
    </form>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
</html>