import React, { useState } from 'react';
import { db } from '../firebase';
import { doc, setDoc } from 'firebase/firestore';
import { UploadCloud, AlertCircle } from 'lucide-react';

export default function UploadMock() {
  const [jsonText, setJsonText] = useState('');
  const [status, setStatus] = useState<{type: 'idle' | 'loading' | 'success' | 'error', message: string}>({ type: 'idle', message: '' });

  const handleUpload = async () => {
    try {
      setStatus({ type: 'loading', message: 'Parsing JSON...' });
      const data = JSON.parse(jsonText);
      
      if (!Array.isArray(data)) {
        throw new Error("JSON must be an array of Mock Test objects.");
      }

      setStatus({ type: 'loading', message: `Uploading ${data.length} Mock Tests...` });
      
      let count = 0;
      for (const item of data) {
        if (!item.id) {
          console.warn("Skipping item without ID", item);
          continue;
        }
        // Save to mock_tests collection
        await setDoc(doc(db, 'mock_tests', item.id), item);
        count++;
      }

      setStatus({ type: 'success', message: `Successfully uploaded ${count} Mock Tests!` });
      setJsonText('');
    } catch (err: any) {
      console.error(err);
      setStatus({ type: 'error', message: err.message || "Failed to parse or upload JSON." });
    }
  };

  const handleFileUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = (event) => {
      setJsonText(event.target?.result as string);
    };
    reader.readAsText(file);
  };

  return (
    <div className="animate-fade-in">
      <div className="card-header">
        <h2 className="card-title">Upload Mock Tests</h2>
      </div>

      <div className="card" style={{ marginBottom: '2rem' }}>
        <h3 style={{ fontSize: '1rem', marginBottom: '1rem' }}>Bulk Upload via JSON File</h3>
        
        <label className="upload-area" style={{ display: 'block' }}>
          <input type="file" accept=".json" style={{ display: 'none' }} onChange={handleFileUpload} />
          <UploadCloud className="upload-icon" />
          <h4>Click to browse or drag and drop your JSON file here</h4>
          <p style={{ marginTop: '0.5rem', fontSize: '0.875rem' }}>Upload a JSON array containing Mock Test metadata and questions.</p>
        </label>
      </div>

      <div className="card">
        <div className="form-group">
          <label className="form-label">Or paste JSON content directly:</label>
          <textarea 
            className="form-control code-preview" 
            value={jsonText}
            onChange={(e) => setJsonText(e.target.value)}
            placeholder={'[\n  {\n    "id": "mock_csit_1",\n    "subject": "Databases",\n    "topic": "SQL",\n    "questionText": "What is...",\n    "options": ["A", "B", "C", "D"],\n    "correctAnswer": "A",\n    "isMCQ": true,\n    "type": "MCQ",\n    "explanation": "Because...",\n    "difficulty": "Medium",\n    "hasImage": false,\n    "imagePath": null\n  }\n]'}
            style={{ height: '300px' }}
          />
        </div>

        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
          <div>
            {status.type === 'loading' && <span className="badge badge-warning">{status.message}</span>}
            {status.type === 'success' && <span className="badge badge-success">{status.message}</span>}
            {status.type === 'error' && (
              <span className="badge badge-warning" style={{ color: 'var(--error-color)', borderColor: 'var(--error-color)', background: 'rgba(239, 68, 68, 0.1)' }}>
                <AlertCircle size={14} style={{ marginRight: '4px' }}/>
                {status.message}
              </span>
            )}
          </div>
          <button 
            className="btn btn-primary" 
            onClick={handleUpload}
            disabled={status.type === 'loading' || !jsonText.trim()}
          >
            {status.type === 'loading' ? 'Uploading...' : 'Upload Mock Tests to Firebase'}
          </button>
        </div>
      </div>
    </div>
  );
}
