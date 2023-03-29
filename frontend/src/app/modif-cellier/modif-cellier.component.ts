import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { ActivatedRoute } from '@angular/router';
import { FetchService } from '../fetch.service';
import { ICellier } from '../icellier';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material/snack-bar';



// User interface
export class User {
  name: any;
  email: any;
}

@Component({
  selector: 'app-modif-cellier',
  templateUrl: './modif-cellier.component.html',
  styleUrls: ['./modif-cellier.component.scss']
})

export class ModifCellierComponent implements OnInit {

  isSignedIn!: boolean;
  // title:string='Liste des celliers';
  UserProfile!: User;
  unCellier: ICellier;
  @Input() cellier: ICellier;
  cellierForm: FormGroup;

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    private route: ActivatedRoute,
    public fetchService: FetchService,
    private formBuilder: FormBuilder,
    private snackBar: MatSnackBar

  ) {
    this.authService.profileUser().subscribe((data: any) => {
      this.UserProfile = data;
      console.log(this.UserProfile);
    });
  }

  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
    });

    this.route.params.subscribe((params) => {
      console.log(params);

      this.fetchService.showCellier(params['id']).subscribe((data: any) => {
        console.log("data showCellier")
        this.unCellier = data.data;
        console.log(this.unCellier);
      });
    })

    this.cellierForm = this.formBuilder.group({
      nom: ['', [Validators.required, Validators.maxLength(20)]],
    });


  }

  modifier() {
    let id = (this.unCellier.id);
    if (this.cellierForm.valid) {
      let unCellier: ICellier = this.cellierForm.value;
      console.log(unCellier);

      this.fetchService.modifCellier(id, unCellier).subscribe((retour) => {
        this.openSnackBar('Modification effectuée avec succès', 'Fermer');

        this.router.navigate(['/profil/liste-cellier']);
      });
    }
  }

  /**
* Cette fonction affiche un message de type snackbar.
* @param message Le message à afficher.
* @param action L'action à afficher sur le bouton de fermeture du snackbar.
*/
  openSnackBar(message: string, action: string) {
    const config = new MatSnackBarConfig();
    config.duration = 3000; // Set the duration to 3 seconds
    config.panelClass = ['mon-snackbar']; // Add a custom CSS class
    this.snackBar.open(message, action, config);
  }

}
