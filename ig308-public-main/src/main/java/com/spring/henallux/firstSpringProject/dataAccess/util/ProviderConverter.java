package com.spring.henallux.firstSpringProject.dataAccess.util;

import com.spring.henallux.firstSpringProject.dataAccess.entity.UserEntity;
import com.spring.henallux.firstSpringProject.model.User;
import com.spring.henallux.firstSpringProject.model.Hobby;
import org.springframework.stereotype.Component;

@Component
public class ProviderConverter {


    public UserEntity userModelToUserEntity(User user) {

        UserEntity userEntity = new UserEntity();

        // Conversion manuelle des champs simples
        userEntity.setName(user.getName());
        userEntity.setAge(user.getAge());
        userEntity.setMale(user.getMale());

        // Conversion du champ hobby (Hobby à String)
        Hobby hobby = user.getHobby();
        if (hobby != null) {
            // On peut convertir l'objet Hobby en une String, par exemple en concatenant les attributs id et name
            userEntity.setHobby(hobby.getId() + ":" + hobby.getName());  // Vous pouvez choisir un autre format
        } else {
            userEntity.setHobby(null); // Ou une valeur par défaut si nécessaire
        }

        return userEntity;
    }

    // Méthode de conversion pour UserEntity vers UserModel
    public User userEntityToUserModel(UserEntity userEntity) {
        // Création d'une instance de User
        User user = new User();

        // Conversion manuelle des champs simples
        user.setName(userEntity.getName());
        user.setAge(userEntity.getAge());
        user.setMale(userEntity.isMale());

        // Conversion du champ hobby (String à Hobby)
        String hobbyStr = userEntity.getHobby();
        if (hobbyStr != null && !hobbyStr.isEmpty()) {
            // On suppose que la chaîne est au format "id:name"
            String[] hobbyParts = hobbyStr.split(":");
            if (hobbyParts.length == 2) {
                Hobby hobby = new Hobby(hobbyParts[0], hobbyParts[1]);  // Créer un objet Hobby à partir de l'id et du nom
                user.setHobby(hobby);
            } else {
                user.setHobby(null); // Si le format est incorrect, on peut attribuer null
            }
        } else {
            user.setHobby(null); // Si hobbyStr est vide ou null
        }

        return user;
    }
}
