package com.spring.henallux.firstSpringProject.service;
import org.springframework.stereotype.Service;
import com.spring.henallux.firstSpringProject.model.Hobby;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class HobbiesService {
    private ArrayList<Hobby> hobbys;

    public HobbiesService() {
        this.hobbys = new ArrayList<>();
        setHobby(new Hobby("1", "rugby"));
        setHobby(new Hobby("2", "foot"));
        setHobby(new Hobby("3", "dance"));
        setHobby(new Hobby("4", "velo"));
    }

    public List<Hobby> getHobbys() {
        return hobbys;
    }

    public void setHobby(Hobby hobby) {
        this.hobbys.add(hobby);
    }
}
