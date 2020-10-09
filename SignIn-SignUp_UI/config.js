const firebaseConfig = {
    apiKey: "AIzaSyBEXqS2Vl1P8tbNQ3Qet5SEdbX0sG8Llmg",
    authDomain: "vit-hack-60e97.firebaseapp.com",
    databaseURL: "https://vit-hack-60e97.firebaseio.com",
    projectId: "vit-hack-60e97",
    storageBucket: "vit-hack-60e97.appspot.com",
    messagingSenderId: "229412641481",
    appId: "1:229412641481:web:f1279e74b3e0bca8f04b18"
  };

  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  const db= firebase.firestore();
  const auth= firebase.auth();

  db.settings({ timestampsInSnapshots: true});
