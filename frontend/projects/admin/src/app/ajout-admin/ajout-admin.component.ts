import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup } from '@angular/forms';
import { AuthService } from 'projects/admin/src/app/shared/auth.service';

@Component({
  selector: 'app-ajout-admin',
  templateUrl: './ajout-admin.component.html',
  styleUrls: ['./ajout-admin.component.scss']
})

export class AjoutAdminComponent implements OnInit {

  isSignedIn!: boolean;
  isOpen: boolean = true;
  registerForm: FormGroup;
  errors: any = null;

  /**
   * Constructeur de la classe AjoutAdminComponent
   * @param router composant Router
   * @param fb composant FormBuilder
   * @param authService composant AuthService
   * @param snackBar composant MatSnackBar
   */
  constructor(
    public router: Router,
    public fb: FormBuilder,
    public authService: AuthService,
    private snackBar: MatSnackBar,
  ) {
    this.registerForm = this.fb.group({
      name: [''],
      email: [''],
      password: [''],
      password_confirmation: [''],
      type: ['1'],
    });
  }

  ngOnInit() { }

  /**
   * Fonction qui vide les champs du formulaire
   */
  viderFormulaire() {
    this.registerForm = this.fb.group({
      name: [''],
      email: [''],
      password: [''],
      password_confirmation: [''],
      type: ['1'],
    });
  }

  /**
   * Fonction qui ajoute un usager admin
   * @param message chaîne - Message du snackbar
   * @param action chaîne - Action
   */
  ajouter(message: string, action: string) {
    this.authService.register(this.registerForm.value).subscribe(
      (result) => {
        console.log(result);
      },
      (error) => {
        this.errors = error.error;
        this.errors = JSON.parse(this.errors);
      },
      () => {
        this.registerForm.reset();
        this.snackBar.open(message, action, { duration: 5000 });
        this.router.navigate(['admin/liste-usager']);
      }
    );
  }
}
