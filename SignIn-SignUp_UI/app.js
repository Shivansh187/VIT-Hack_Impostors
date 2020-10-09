const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");

sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign-up-mode");
});


// //google login

// const google= document.querySelector("#google");

//     google.addEventListener('click', (e) => {
//       let provider = new firebase.auth.GoogleAuthProvider();

//       auth.signInWithPopup(provider).then(cred => {
//         console.log(cred.user);
//       });
//     });

//google login

const google= document.querySelector("#google");

    google.addEventListener('click', (e) => {
      let provider = new firebase.auth.GoogleAuthProvider();

      auth.signInWithPopup(provider).then(cred => {
        console.log(cred.user);
      });
    });




  // signup
  const signupform= document.querySelector('sign-up-form');


  signupform.addEventListener('click', (e) => {

  signupform.addEventListener('submit', (e) => {

    e.preventDefault();

    const username= signupform['sign-up-name'].value
    const email= signupform['sign-up-email'].value;
    const password= signupform['sign-up-password'].value;

    auth.createUserWithEmailAndPassword(email,password).then(cred => {
      cred.user.sendEmailVerification();
      auth.signOut();
      alert('Verify Your Email ID to be able to Login');

      signupform.reset();
    });

  });


  // login using email

  const loginform= document.querySelector('#login-form');

    loginform.addEventListener('submit', (e) => {
      e.preventDefault();

      const email= loginform['login-email'].value;
      const password= loginform['login-password'].value;


      auth.signInWithEmailAndPassword(email,password).then( cred => {
        if(!cred.user.emailVerified){
          alert('Verify Your Email ID to be able to Login');
          auth.signOut();
        }
        console.log(cred.user);

        alert("welcome")


        loginform.reset();
      });
    });