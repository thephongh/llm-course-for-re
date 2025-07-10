import { useEffect } from 'react';

export default function Home() {
  useEffect(() => {
    // Redirect to the actual course HTML file
    window.location.replace('/course.html');
  }, []);

  return (
    <div style={{ 
      display: 'flex', 
      justifyContent: 'center', 
      alignItems: 'center', 
      height: '100vh',
      fontFamily: 'system-ui, -apple-system, sans-serif'
    }}>
      <p>Redirecting to course...</p>
    </div>
  );
}