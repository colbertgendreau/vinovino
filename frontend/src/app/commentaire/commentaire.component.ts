import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { FormBuilder, FormGroup, FormControl, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Imesbouteilles } from '../imesbouteilles';
import { FetchService } from '../fetch.service';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material/snack-bar';
import { debounceTime } from 'rxjs/operators';

export class User {
  name: any;
  email: any;
}

@Component({
  selector: 'app-commentaire',
  templateUrl: './commentaire.component.html',
  styleUrls: ['./commentaire.component.scss']
})
export class CommentaireComponent implements OnInit {

  isSignedIn!: boolean;
  UserProfile!: User;

  commentaireForm: FormGroup;
  bouteille: Imesbouteilles;
  commentaires: string;

  formSubmitted = false;

  @Input() uneBouteille: Imesbouteilles;

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    public fetchService: FetchService,
    private snackBar: MatSnackBar

  ) {
    this.authService.profileUser().subscribe((data: any) => {
      this.UserProfile = data;
    });
  }

  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
    });

    this.commentaireForm = this.formBuilder.group({
      commentaires: ['', Validators.maxLength(500)],
    });

    this.route.params.subscribe(params => {

      this.fetchService.showDetail(params['id']).subscribe((data: any) => {
        this.uneBouteille = data.data;
      });

    });

    this.commentaireForm.get('commentaires').valueChanges.pipe(
      debounceTime(1200),
    ).subscribe(() => {
      this.ajouterCommentaire();
      this.openSnackBar('Sauvegarde', 'Fermer')
    });

  }

  /**
 * Ajoute un commentaire à une bouteille et envoie une requête de mise à jour via un service.
 */
  ajouterCommentaire() {
    if (this.commentaireForm.valid) {
      const commentaires = this.commentaireForm.get('commentaires').value;
      this.uneBouteille.commentaires = commentaires;

      this.route.params.subscribe(params => {
        const bouteille = { ...this.uneBouteille, commentaires };
        this.fetchService.ajoutCommentaire(params['id'], bouteille).subscribe((data: any) => {
          let retour = data.data;
        });
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
