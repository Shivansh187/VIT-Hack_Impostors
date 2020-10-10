const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");

sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign-up-mode");
});

auth.onAuthStateChanged( user => {

  if(user){
    alert("welcome");

  } else {
    

    //login
    const loginform= document.querySelector('#login-form');

    loginform.addEventListener('submit', (e) => {
      e.preventDefault();

      const email= loginform['username'].value;
      const password= loginform['password'].value;


      auth.signInWithEmailAndPassword(email,password).then( cred => {
        if(!cred.user.emailVerified){
          alert('Verify Your Email ID to be able to Login');
          auth.signOut();
        }
        console.log(cred.user);
        loginform.reset();
      });
    });

    

    //signup
    const signupform= document.querySelector('#signup-form');

    signupform.addEventListener('submit', (e) => {
      e.preventDefault();

      const email= signupform['signup-email'].value;
      const password= signupform['signup-password'].value;

      auth.createUserWithEmailAndPassword(email,password).then(cred => {
        cred.user.sendEmailVerification();
        auth.signOut();
        alert('Verify Your Email ID to be able to Login');

        signupform.reset();
      });

    });

  }

});
