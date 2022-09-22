package com.acorn.boram.reserve.dao;

import java.util.List;

import com.acorn.boram.reserve.dto.ItemsDto;

public interface ItemDao {

	public List<ItemsDto> getList(ItemsDto dto);
}
