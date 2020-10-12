// const firebaseConfig = {
//   apiKey: "AIzaSyBEXqS2Vl1P8tbNQ3Qet5SEdbX0sG8Llmg",
//   authDomain: "vit-hack-60e97.firebaseapp.com",
//   databaseURL: "https://vit-hack-60e97.firebaseio.com",
//   projectId: "vit-hack-60e97",
//   storageBucket: "vit-hack-60e97.appspot.com",
//   messagingSenderId: "229412641481",
//   appId: "1:229412641481:web:f1279e74b3e0bca8f04b18"
// };
var firebaseConfig = {
  apiKey: "AIzaSyBC6Cmx5rVAHzAsZmpFCZg8X6MJWKumSvk",
  authDomain: "certify-b6605.firebaseapp.com",
  databaseURL: "https://certify-b6605.firebaseio.com",
  projectId: "certify-b6605",
  storageBucket: "certify-b6605.appspot.com",
  messagingSenderId: "1051897603325",
  appId: "1:1051897603325:web:5de9b6090b31bbd03aca94"
};
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  const db= firebase.firestore();
  const auth= firebase.auth();
  const storageRef = firebase.storage().ref();

