import React, { useState } from 'react';
import { BrowserRouter as Router, Routes, Route, Link, useLocation } from 'react-router-dom';
import { Database, FileUp, ClipboardList, LogOut, Settings } from 'lucide-react';
import Dashboard from './pages/Dashboard';
import UploadPYQ from './pages/UploadPYQ';
import UploadMock from './pages/UploadMock';
import SettingsPage from './pages/Settings';
import ManagePYQs from './pages/ManagePYQs';
import ManageMocks from './pages/ManageMocks';

function Sidebar() {
  const location = useLocation();
  
  const navItems = [
    { path: '/', icon: <Database size={20} />, label: 'Dashboard' },
    { path: '/manage-pyqs', icon: <ClipboardList size={20} />, label: 'Manage PYQs' },
    { path: '/manage-mocks', icon: <ClipboardList size={20} />, label: 'Manage Mocks' },
    { path: '/upload-pyq', icon: <FileUp size={20} />, label: 'Upload PYQs' },
    { path: '/upload-mock', icon: <FileUp size={20} />, label: 'Upload Mock Tests' },
    { path: '/settings', icon: <Settings size={20} />, label: 'Settings' },
  ];

  return (
    <aside className="sidebar">
      <div className="sidebar-header">
        <h1 className="sidebar-brand">GateX Admin</h1>
      </div>
      <nav className="sidebar-nav">
        {navItems.map((item) => (
          <Link
            key={item.path}
            to={item.path}
            className={`nav-item ${location.pathname === item.path ? 'active' : ''}`}
          >
            {item.icon}
            {item.label}
          </Link>
        ))}
      </nav>
      <div style={{ marginTop: 'auto', padding: '1.5rem' }}>
        <button className="btn btn-secondary" style={{ width: '100%', display: 'flex', justifyContent: 'center' }}>
          <LogOut size={18} />
          Logout
        </button>
      </div>
    </aside>
  );
}

function Topbar() {
  return (
    <header className="topbar">
      <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
        <div style={{ textAlign: 'right' }}>
          <div style={{ fontWeight: 600, fontSize: '0.875rem' }}>Admin User</div>
          <div style={{ color: 'var(--text-secondary)', fontSize: '0.75rem' }}>admin@gatex.com</div>
        </div>
        <div style={{ width: '40px', height: '40px', borderRadius: '50%', backgroundColor: 'var(--primary-color)', display: 'flex', alignItems: 'center', justifyContent: 'center', fontWeight: 'bold' }}>
          A
        </div>
      </div>
    </header>
  );
}

function App() {
  // Simple auth state for now
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [password, setPassword] = useState('');

  if (!isAuthenticated) {
    return (
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', minHeight: '100vh', backgroundColor: 'var(--bg-color)' }}>
        <div className="card" style={{ width: '100%', maxWidth: '400px' }}>
          <h2 style={{ textAlign: 'center', marginBottom: '2rem' }}>GateX Admin Portal</h2>
          <div className="form-group">
            <label className="form-label">Admin Secret Key</label>
            <input 
              type="password" 
              className="form-control" 
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Enter secret key..."
              onKeyDown={(e) => e.key === 'Enter' && password === 'gatex123' && setIsAuthenticated(true)}
            />
          </div>
          <button 
            className="btn btn-primary" 
            style={{ width: '100%' }}
            onClick={() => {
              if (password === 'gatex123') setIsAuthenticated(true);
              else alert('Invalid secret key');
            }}
          >
            Access Portal
          </button>
        </div>
      </div>
    );
  }

  return (
    <Router>
      <div className="app-container">
        <Sidebar />
        <main className="main-content">
          <Topbar />
          <div className="page-content animate-fade-in">
            <Routes>
              <Route path="/" element={<Dashboard />} />
              <Route path="/manage-pyqs" element={<ManagePYQs />} />
              <Route path="/manage-mocks" element={<ManageMocks />} />
              <Route path="/upload-pyq" element={<UploadPYQ />} />
              <Route path="/upload-mock" element={<UploadMock />} />
              <Route path="/settings" element={<SettingsPage />} />
              <Route path="*" element={<div><h2>404 Not Found</h2></div>} />
            </Routes>
          </div>
        </main>
      </div>
    </Router>
  );
}

export default App;
