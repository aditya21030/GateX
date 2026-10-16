import React, { useState, useEffect } from 'react';
import { collection, getDocs, deleteDoc, doc } from 'firebase/firestore';
import { db } from '../firebase';
import { Trash2, Search, Filter } from 'lucide-react';

export default function ManagePYQs() {
  const [pyqs, setPyqs] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  
  // Filters
  const [searchTerm, setSearchTerm] = useState('');
  const [yearFilter, setYearFilter] = useState('All');
  const [subjectFilter, setSubjectFilter] = useState('All');
  const [examFilter, setExamFilter] = useState('All');

  const fetchPYQs = async () => {
    setLoading(true);
    try {
      const querySnapshot = await getDocs(collection(db, 'pyqs'));
      const fetched = querySnapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
      setPyqs(fetched);
    } catch (error) {
      console.error('Error fetching PYQs:', error);
      alert('Failed to fetch PYQs');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchPYQs();
  }, []);

  const handleDelete = async (id: string) => {
    if (!window.confirm('Are you sure you want to delete this PYQ? This cannot be undone.')) return;
    
    try {
      await deleteDoc(doc(db, 'pyqs', id));
      setPyqs(prev => prev.filter(pyq => pyq.id !== id));
    } catch (error) {
      console.error('Error deleting PYQ:', error);
      alert('Failed to delete PYQ');
    }
  };

  // Extract unique values for dropdowns
  const uniqueYears = Array.from(new Set(pyqs.map(p => p.year))).filter(Boolean).sort((a, b) => b - a);
  const uniqueSubjects = Array.from(new Set(pyqs.map(p => p.subject))).filter(Boolean).sort();

  const filteredPYQs = pyqs.filter(pyq => {
    // Text search
    const matchesSearch = 
      pyq.id?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      pyq.questionText?.toLowerCase().includes(searchTerm.toLowerCase());
    
    // Dropdown filters
    const matchesYear = yearFilter === 'All' || String(pyq.year) === yearFilter;
    const matchesSubject = subjectFilter === 'All' || pyq.subject === subjectFilter;
    
    // Exam filter based on ID containing 'CS'
    const isCSIT = pyq.id?.toUpperCase().includes('CS');
    let matchesExam = true;
    if (examFilter === 'CSIT') {
      matchesExam = isCSIT;
    } else if (examFilter === 'DA') {
      matchesExam = !isCSIT;
    }

    return matchesSearch && matchesYear && matchesSubject && matchesExam;
  });

  const optionStyle = { background: '#1e1e2d', color: '#ffffff' };

  return (
    <div className="animate-fade-in">
      <div className="card-header" style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
        <h2 className="card-title">Manage PYQs</h2>
        
        <div style={{ display: 'flex', flexWrap: 'wrap', gap: '1rem', alignItems: 'center' }}>
          {/* Search Bar */}
          <div style={{ flex: 1, minWidth: '200px', display: 'flex', alignItems: 'center', gap: '0.5rem', background: 'var(--bg-color)', padding: '0.5rem 1rem', borderRadius: '8px', border: '1px solid var(--border-color)' }}>
            <Search size={18} color="var(--text-secondary)" />
            <input 
              type="text" 
              placeholder="Search questions or IDs..." 
              style={{ background: 'transparent', border: 'none', color: 'var(--text-primary)', outline: 'none', width: '100%' }}
              value={searchTerm}
              onChange={e => setSearchTerm(e.target.value)}
            />
          </div>

          {/* Filters */}
          <div style={{ display: 'flex', gap: '0.5rem', alignItems: 'center', background: 'var(--bg-color)', padding: '0.5rem', borderRadius: '8px', border: '1px solid var(--border-color)' }}>
            <Filter size={16} color="var(--text-secondary)" style={{ marginLeft: '0.5rem' }} />
            
            <select 
              value={examFilter} 
              onChange={e => setExamFilter(e.target.value)}
              style={{ background: 'transparent', border: 'none', color: 'var(--text-primary)', outline: 'none', cursor: 'pointer', padding: '0 0.5rem' }}
            >
              <option value="All" style={optionStyle}>All Exams</option>
              <option value="DA" style={optionStyle}>GATE DA</option>
              <option value="CSIT" style={optionStyle}>GATE CSIT</option>
            </select>

            <div style={{ width: '1px', height: '20px', background: 'var(--border-color)' }}></div>

            <select 
              value={yearFilter} 
              onChange={e => setYearFilter(e.target.value)}
              style={{ background: 'transparent', border: 'none', color: 'var(--text-primary)', outline: 'none', cursor: 'pointer', padding: '0 0.5rem' }}
            >
              <option value="All" style={optionStyle}>All Years</option>
              {uniqueYears.map(year => <option key={year} value={year} style={optionStyle}>{year}</option>)}
            </select>

            <div style={{ width: '1px', height: '20px', background: 'var(--border-color)' }}></div>

            <select 
              value={subjectFilter} 
              onChange={e => setSubjectFilter(e.target.value)}
              style={{ background: 'transparent', border: 'none', color: 'var(--text-primary)', outline: 'none', cursor: 'pointer', padding: '0 0.5rem', maxWidth: '150px' }}
            >
              <option value="All" style={optionStyle}>All Subjects</option>
              {uniqueSubjects.map(sub => <option key={sub} value={sub} style={optionStyle}>{sub}</option>)}
            </select>
          </div>
        </div>
      </div>

      <div className="card" style={{ padding: 0, overflow: 'hidden' }}>
        {loading ? (
          <div style={{ padding: '2rem', textAlign: 'center', color: 'var(--text-secondary)' }}>Loading PYQs...</div>
        ) : (
          <div style={{ overflowX: 'auto' }}>
            <table style={{ width: '100%', borderCollapse: 'collapse', textAlign: 'left' }}>
              <thead>
                <tr style={{ borderBottom: '1px solid var(--border-color)', backgroundColor: 'rgba(255,255,255,0.02)' }}>
                  <th style={{ padding: '1rem' }}>ID</th>
                  <th style={{ padding: '1rem' }}>Exam</th>
                  <th style={{ padding: '1rem' }}>Subject</th>
                  <th style={{ padding: '1rem' }}>Year</th>
                  <th style={{ padding: '1rem' }}>Question Snippet</th>
                  <th style={{ padding: '1rem', textAlign: 'right' }}>Actions</th>
                </tr>
              </thead>
              <tbody>
                {filteredPYQs.length === 0 ? (
                  <tr>
                    <td colSpan={6} style={{ padding: '2rem', textAlign: 'center', color: 'var(--text-secondary)' }}>No PYQs found</td>
                  </tr>
                ) : (
                  filteredPYQs.map(pyq => {
                    const isCSIT = pyq.id?.toUpperCase().includes('CS');
                    return (
                    <tr key={pyq.id} style={{ borderBottom: '1px solid var(--border-color)' }}>
                      <td style={{ padding: '1rem', color: 'var(--primary-color)', fontSize: '0.85rem', maxWidth: '120px', overflow: 'hidden', textOverflow: 'ellipsis' }} title={pyq.id}>
                        {pyq.id}
                      </td>
                      <td style={{ padding: '1rem' }}>
                        <span style={{ 
                          padding: '0.2rem 0.4rem', 
                          borderRadius: '4px', 
                          fontSize: '0.75rem', 
                          fontWeight: 'bold',
                          backgroundColor: isCSIT ? 'rgba(59, 130, 246, 0.1)' : 'rgba(16, 185, 129, 0.1)',
                          color: isCSIT ? '#3b82f6' : '#10b981'
                        }}>
                          {isCSIT ? 'CSIT' : 'DA'}
                        </span>
                      </td>
                      <td style={{ padding: '1rem', fontSize: '0.9rem' }}>{pyq.subject}</td>
                      <td style={{ padding: '1rem', fontSize: '0.9rem' }}>{pyq.year}</td>
                      <td style={{ padding: '1rem', maxWidth: '250px', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap', fontSize: '0.9rem' }}>
                        {pyq.questionText}
                      </td>
                      <td style={{ padding: '1rem', textAlign: 'right' }}>
                        <button 
                          onClick={() => handleDelete(pyq.id)}
                          style={{ background: 'transparent', border: 'none', cursor: 'pointer', color: 'var(--error-color)' }}
                          title="Delete PYQ"
                        >
                          <Trash2 size={18} />
                        </button>
                      </td>
                    </tr>
                  );
                  })
                )}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  );
}
