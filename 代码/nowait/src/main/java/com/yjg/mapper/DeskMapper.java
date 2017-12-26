package com.yjg.mapper;

import com.yjg.entity.Desk;

import java.util.List;

/**
 * Created by ljh on 2017/12/5.
 */
public interface DeskMapper {
    List<Desk> deskList(int id);
    public int insert(Desk desk);
    public void  update(Desk desk);

    void delete(Integer id);
}
