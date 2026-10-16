import { initializeApp } from 'firebase/app';
import { getFirestore } from 'firebase/firestore';
import { getAuth } from 'firebase/auth';

const firebaseConfig = {
  apiKey: "AIzaSyCvzM5ktSLrfkrvsNYzQifmDAXqKBq_z5Q",
  appId: "1:665863577421:web:1c1f4e94c48315b7a72104",
  messagingSenderId: "665863577421",
  projectId: "gatex-111",
  authDomain: "gatex-111.firebaseapp.com",
  storageBucket: "gatex-111.firebasestorage.app",
  measurementId: "G-R0PP9TSTNQ"
};

const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);
export const auth = getAuth(app);
