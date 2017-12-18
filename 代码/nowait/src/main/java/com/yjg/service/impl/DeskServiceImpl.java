package com.yjg.service.impl;


import com.yjg.entity.Desk;
import com.yjg.mapper.DeskMapper;
import com.yjg.service.DeskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.security.krb5.internal.crypto.Des;

import java.util.List;

/**
 * Created by ljh on 2017/11/21.
 */
@Service
public class DeskServiceImpl implements DeskService {
    @Autowired
    private DeskMapper deskMapper;
    @Override
    public List<Desk> queryDeskAll(int id) {
        List<Desk> deskList=deskMapper.deskList(id);
        return  deskList;
    }

    @Override
    public void addDesk(Desk desk) throws Exception {
        deskMapper.insert(desk);
    }


}
