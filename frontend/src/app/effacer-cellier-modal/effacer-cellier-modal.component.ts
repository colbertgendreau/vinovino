import { Component, Input, Output, EventEmitter, OnInit } from '@angular/core';
import { FetchService } from '../fetch.service';
import { Router } from '@angular/router';
import { MatSnackBar, MatSnackBarConfig  } from '@angular/material/snack-bar';


@Component({
  selector: 'app-effacer-cellier-modal',
  templateUrl: './effacer-cellier-modal.component.html',
  styleUrls: ['./effacer-cellier-modal.component.scss']
})
export class EffacerModalComponent {
  @Input() id!: number;
  @Input() isVisible = false;
  @Output() itemEfface: EventEmitter<void> = new EventEmitter<void>();
  @Output() closed = new EventEmitter<void>();

  constructor(
    public fetchService: FetchService,
    public router: Router,
    private snackBar: MatSnackBar,
  ) { }

/**
 * Confirme la suppression d'un élément et le supprime une fois confirmé.
Fait également défiler la fenêtre vers le haut pour un meilleur affichage.
 */
  confirmer() {
    window.scroll({ // pour scroll up quand on arrive sur la page
        top: 0, 
        left: 0, 
        behavior: 'smooth' 
    });

    this.isVisible = false;
    this.fetchService.supprimerCellier(this.id).subscribe((retour) => {
      this.openSnackBar('Cellier effacé avec succès', 'Fermer');
      this.itemEfface.emit();
    });
  }

  /**
   * Cette fonction permet de fermer un modal 
   */
  annuler() {

    this.isVisible = false;
    this.closed.emit(); // émet l'évenement 'closed'
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
