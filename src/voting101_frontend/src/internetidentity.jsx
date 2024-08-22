import React, { useEffect, useState } from 'react';
import { AuthClient } from '@dfinity/auth-client';

const InternetIdentityAuth = () => {
  const [authClient, setAuthClient] = useState(null);
  const [identity, setIdentity] = useState(null);
  const [principal, setPrincipal] = useState(null);

  useEffect(() => {
    const initAuthClient = async () => {
      const client = await AuthClient.create();
      setAuthClient(client);
      
      if (await client.isAuthenticated()) {
        const identity = client.getIdentity();
        setIdentity(identity);
        setPrincipal(identity.getPrincipal().toText());
      }
    };

    initAuthClient();
  }, []);

  const handleLogin = async () => {
    await authClient.login({
      identityProvider: "https://identity.ic0.app",
      onSuccess: () => {
        const identity = authClient.getIdentity();
        setIdentity(identity);
        setPrincipal(identity.getPrincipal().toText());
      },
    });
  };

  const handleLogout = () => {
    authClient.logout();
    setIdentity(null);
    setPrincipal(null);
  };

  return (
    <div>
      {identity ? (
        <div>
          <p>Authenticated as: {principal}</p>
          <button onClick={handleLogout}>Logout</button>
        </div>
      ) : (
        <button onClick={handleLogin}>Login with Internet Identity</button>
      )}
    </div>
  );
};

export default InternetIdentityAuth;
