
import React from 'react';
import ReactDOM from 'react-dom';
import InternetIdentityAuth from './components/InternetIdentityAuth'; // Ensure the path is correct
import './index.scss';
function App() {
  return (
    <div>
      <h1>Welcome to My App</h1>
      <InternetIdentityAuth />
      {/* Other components */}
    </div>
  );
}

ReactDOM.render(<App />, document.getElementById('root'));
