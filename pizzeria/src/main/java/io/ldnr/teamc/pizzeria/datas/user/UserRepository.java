package io.ldnr.teamc.pizzeria.datas.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



/*
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Integer> {

}



public interface UserRepository extends JpaRepository {
    @Query("SELECT u FROM User u WHERE u.nom=:nomOrEmail OR u.email=:nomOrEmail")
    User findByNomOrEmail(String nomOrEmail);
}
*/