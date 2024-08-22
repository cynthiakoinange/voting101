import UserManagement "user_management";
import InternetIdentity "internet_identity";

actor VotingBackend {
    // Reuse or reference functions from `user_management.mo`
    public query func greet(name: Text) : async Text {
        return UserManagement.greet(name);
    }

    public query func getUserInfo(userId: Text) : async ?UserManagement.User {
        return UserManagement.getUserInfo(userId);
    }

    // Internet Identity functions
    public query func authenticate(userId: Text) : async Text {
        return InternetIdentity.authenticate(userId);
    }

    public query func registerUser(userId: Text, userInfo: UserManagement.User) : async Bool {
        return InternetIdentity.registerUser(userId, userInfo);
    }

    public query func startSession(userId: Text) : async SessionToken {
        return InternetIdentity.startSession(userId);
    }

    public query func endSession(token: SessionToken) : async Bool {
        return InternetIdentity.endSession(token);
    }

    public query func verifyUser(userId: Text, token: AuthToken) : async Bool {
        return InternetIdentity.verifyUser(userId, token);
    }

    public query func resetPassword(userId: Text) : async Bool {
        return InternetIdentity.resetPassword(userId);
    }

    // Add more functions as needed
}
