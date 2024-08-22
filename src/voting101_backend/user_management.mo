import Nat "mo:base/Nat";
import Principal "mo:base/Principal";

actor UserManager {
    stable var userData : [(Principal, Text)] = [];

    public query func getUserData(user : Principal) : async ?Text {
        switch (userData.find((u) -> u.0 == user)) {
            case (?entry) { return ?entry.1 };
            case null { return null };
        };
    };

    public func setUserData(user : Principal, data : Text) : async () {
        let index = userData.findIndex((u) -> u.0 == user);
        switch (index) {
            case (?i) { userData[i] := (user, data) };
            case null { userData := userData # [(user, data)] };
        };
    };
}
