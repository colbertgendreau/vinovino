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
      type: ['0'],
    });
  }
  ngOnInit() {}

  /**
   *  Appelée lors de la soumission du formulaire d'inscription, envoie une requête HTTP POST à l'API pour
enregistrer un nouvel utilisateur. En cas de succès, redirige l'utilisateur vers la page de connexion.
En cas d'erreur, stocke le message d'erreur renvoyé par l'API dans la variable 'errors'.
   */
  onSubmit() {
    this.authService.register(this.registerForm.value).subscribe(
      (result) => {
      },
      (error) => {
        this.errors = error.error;
        this.errors = JSON.parse(this.errors);
      },
      () => {
        this.registerForm.reset();
        this.router.navigate(['connexion']);
      }
    );
  }
}
