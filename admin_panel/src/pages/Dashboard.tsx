import React, { useEffect, useState } from 'react';
import { db } from '../firebase';
import { collection, getDocs } from 'firebase/firestore';
import { Layers, CheckSquare, Clock } from 'lucide-react';

export default function Dashboard() {
  const [stats, setStats] = useState({
    totalPYQs: 0,
    totalMocks: 0
  });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchStats = async () => {
      try {
        const pyqsSnap = await getDocs(collection(db, 'pyqs'));
        const mocksSnap = await getDocs(collection(db, 'mock_tests'));
        
        setStats({
          totalPYQs: pyqsSnap.size,
          totalMocks: mocksSnap.size
        });
      } catch (error) {
        console.error("Error fetching stats:", error);
      } finally {
        setLoading(false);
      }
    };
    
    fetchStats();
  }, []);

  return (
    <div>
      <div className="card-header">
        <h2 className="card-title">Dashboard Overview</h2>
      </div>
      
      {loading ? (
        <div style={{ textAlign: 'center', padding: '2rem', color: 'var(--text-secondary)' }}>Loading stats...</div>
      ) : (
        <div className="stats-grid animate-fade-in">
          <div className="stat-card">
            <div className="stat-icon">
              <Layers size={24} />
            </div>
            <div className="stat-info">
              <h3>{stats.totalPYQs}</h3>
              <p>Total PYQs Uploaded</p>
            </div>
          </div>
          
          <div className="stat-card">
            <div className="stat-icon">
              <CheckSquare size={24} />
            </div>
            <div className="stat-info">
              <h3>{stats.totalMocks}</h3>
              <p>Total Mock Tests Available</p>
            </div>
          </div>
          
          <div className="stat-card">
            <div className="stat-icon" style={{ color: '#10B981', background: 'rgba(16, 185, 129, 0.1)' }}>
              <Clock size={24} />
            </div>
            <div className="stat-info">
              <h3>Active</h3>
              <p>Firebase Connection</p>
            </div>
          </div>
        </div>
      )}

      <div className="card animate-fade-in" style={{ marginTop: '2rem' }}>
        <h3 style={{ marginBottom: '1rem' }}>Welcome to GateX Admin</h3>
        <p>
          Use the sidebar to navigate to the upload sections. You can easily upload bulk JSON files for both PYQs and Mock Tests. 
          When you upload new data, it will instantly be available to all students using the app, bypassing the need for a Play Store update!
        </p>
      </div>
    </div>
  );
}
