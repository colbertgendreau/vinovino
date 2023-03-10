import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../shared/auth.service';
import { FormBuilder, FormGroup } from '@angular/forms';
@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss'],
})
export class SignupComponent implements OnInit {
  registerForm: FormGroup;
  errors: any = null;

  constructor(
    public router: Router,
    public fb: FormBuilder,
    public authService: AuthService
  ) {
    this.registerForm = this.fb.group({
      name: [''],
      email: [''],
      password: [''],
      password_confirmation: [''],
    });
  }
  ngOnInit() {}
  onSubmit() {

    console.log('Je suis à l\'intérieur de signup.component.ts')
    this.authService.register(this.registerForm.value).subscribe(
      (result) => {
        console.log(result);
      },
      (error) => {
        this.errors = error.error;
        this.errors = JSON.parse(this.errors);

        if (this.errors.name[0] === "The name field is required.") {
          this.errors.name = "Le champ nom est obligatoire.";
        } else if (this.errors.name[0] === "The name must be between 2 and 100 characters.") {
          this.errors.name = "Le nom doit comporter entre 2 et 100 caractères.";
        }

        if (this.errors.email[0] === "The email field is required.") {
          this.errors.email = "Le champ courriel est obligatoire.";
        } else if (this.errors.email[0] === "The email must be a valid email address.") {
          this.errors.email = "Le courriel doit être valide.";
        }

        if (this.errors.password[0] === "The password field is required.") {
          this.errors.password = "Le champ du mot de passe est obligatoire.";
        } else if (this.errors.password[0] === "The password must be at least 6 characters.") {
          this.errors.password = "Le mot de passe doit comporter au moins 6 caractères.";
        } else if (this.errors.password[0] === "The password confirmation does not match.") {
          this.errors.password = "La confirmation du mot de passe ne correspond pas.";          
        }
      },
      () => {
        this.registerForm.reset();
        this.router.navigate(['connexion']);
      }
    );
  }
}
