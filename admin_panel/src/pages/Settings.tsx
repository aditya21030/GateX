import React from 'react';

export default function Settings() {
  return (
    <div className="animate-fade-in">
      <div className="card-header">
        <h2 className="card-title">Settings</h2>
      </div>

      <div className="card">
        <h3>Admin Panel Settings</h3>
        <p style={{ marginTop: '1rem' }}>
          This is a placeholder for future admin settings. Currently, configuration is handled via Firebase Environment Variables.
        </p>
      </div>
    </div>
  );
}
