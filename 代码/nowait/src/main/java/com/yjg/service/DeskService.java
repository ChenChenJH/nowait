package com.yjg.service;

import com.yjg.entity.Desk;

import java.util.List;

/**
 * Created by ljh on 2017/11/21.
 */
public interface DeskService {
	List<Desk> queryDeskAll(int id);

	public void addDesk(Desk desk) throws Exception;

	public void update(Desk desk);

}
