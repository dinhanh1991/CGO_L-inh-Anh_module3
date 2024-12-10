package com.demo.test.service.user;

import com.demo.test.model.User;
import com.demo.test.repository.user.IUserRepo;
import com.demo.test.repository.user.UserRepo;

import java.util.List;
import java.util.Optional;

public class UserService implements IUserService {
    private final IUserRepo iUserRepo = new UserRepo();

    public UserService() {
    }

    // Create
    @Override
    public void addUser(User user) {
        iUserRepo.addUser(user);
    }

    // Find
    @Override
    public Optional<User> findUserByID(int userId) {
        return iUserRepo.findUserByID(userId);
    }

    @Override
    public List<User> findAllUsers() {
        return iUserRepo.findAllUsers();
    }

    @Override
    public Optional<User> findUserByUsernameAndPassword(String username, String password) {
        return iUserRepo.findUserByUsernameAndPassword(username, password);
    }

    @Override
    public Optional<User> findByUsername(String username) {
        return iUserRepo.findByUsername(username);
    }

    @Override
    public Optional<User> findByEmail(String email) {
        return iUserRepo.findByEmail(email);
    }

    @Override
    public List<User> searchUsers(String searchKeyword) {
        return iUserRepo.searchUsers(searchKeyword);
    }

    // Update
    @Override
    public void updateUser(User user) {
        iUserRepo.updateUser(user);
    }

    // Delete
    @Override
    public boolean deleteUserByUsername(String username) {
        return iUserRepo.deleteUserByUsername(username);
    }
}