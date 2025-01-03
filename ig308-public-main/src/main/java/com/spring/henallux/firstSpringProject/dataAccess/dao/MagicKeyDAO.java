package com.spring.henallux.firstSpringProject.dataAccess.dao;

import com.spring.henallux.firstSpringProject.dataAccess.entity.MagicKeyEntity;
import com.spring.henallux.firstSpringProject.dataAccess.repository.MagicKeyRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class MagicKeyDAO implements MagicKeyDataAccess {
    private MagicKeyRepository magicKeyRepository;

    public MagicKeyDAO(MagicKeyRepository magicKeyRepository) {
        this.magicKeyRepository = magicKeyRepository;
    }

    @Override
    public ArrayList<String> getMagicKeys() {
        List<MagicKeyEntity> magicKeyEntities = magicKeyRepository.findAll();

        ArrayList<String> magicKeys = new ArrayList<>();
        for (MagicKeyEntity entity : magicKeyEntities) {
            magicKeys.add(entity.getMagicValue());
        }

        return magicKeys;
    }
}
