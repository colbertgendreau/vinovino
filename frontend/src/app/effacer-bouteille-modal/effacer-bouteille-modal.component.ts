import { Component, Input, Output, EventEmitter, OnInit } from '@angular/core';
import { FetchService } from '../fetch.service';
import { Router } from '@angular/router';
import { MatSnackBar, MatSnackBarConfig  } from '@angular/material/snack-bar';


@Component({
  selector: 'app-effacer-bouteille-modal',
  templateUrl: './effacer-bouteille-modal.component.html',
  styleUrls: ['./effacer-bouteille-modal.component.scss']
})
export class EffacerBouteilleModalComponent {

  @Input() id!: number;
  @Input() isVisible = false;
  @Output() itemEfface: EventEmitter<void> = new EventEmitter<void>();
  @Output() closed = new EventEmitter<void>();

  constructor(
    public fetchService: FetchService,
    public router: Router,
    private snackBar: MatSnackBar,
  ) { }


  confirmer() {
    window.scroll({ // pour scroll up quand on arrive sur la page
        top: 0, 
        left: 0, 
        behavior: 'smooth' 
    });

    this.isVisible = false;
    console.log(this.id);
    
    this.fetchService.supprimerBouteille(this.id).subscribe((retour) => {
      console.log(retour);
      this.openSnackBar('Bouteille effacée avec succès', 'Fermer')
      this.itemEfface.emit();
    });
  }

  archiver() {

    this.isVisible = false;
    this.closed.emit(); // emit the 'closed' event
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
