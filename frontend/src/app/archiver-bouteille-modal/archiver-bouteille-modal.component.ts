import { Component, Input, Output, EventEmitter, OnInit } from '@angular/core';
import { FetchService } from '../fetch.service';
import { ActivatedRoute, Router } from '@angular/router';
import { MatSnackBar, MatSnackBarConfig  } from '@angular/material/snack-bar';
import { Imesbouteilles } from '../imesbouteilles';
import { Ibouteillecellier } from '../ibouteille-cellier';

@Component({
  selector: 'app-archiver-bouteille-modal',
  templateUrl: './archiver-bouteille-modal.component.html',
  styleUrls: ['./archiver-bouteille-modal.component.scss']
})
export class ArchiverBouteilleModalComponent {

  @Input() id!: number;
  @Input() quantite!: number;
  @Input() isVisible = false;
  @Output() itemArchive: EventEmitter<void> = new EventEmitter<void>();
  @Output() closed = new EventEmitter<void>();

  bouteille: Imesbouteilles;
  bouteilles: Array<Ibouteillecellier>;
  cellierId: string;

  constructor(
    public fetchService: FetchService,
    public router: Router,
    private snackBar: MatSnackBar,
    private route: ActivatedRoute,
  ) { }


  annuler() {
    window.scroll({ // pour scroll up quand on arrive sur la page
        top: 0, 
        left: 0, 
        behavior: 'smooth' 
    });

    this.isVisible = false;
    console.log(this.id);
    console.log(this.quantite);

    this.fetchService.showBouteille(this.id).subscribe((data:any)=>{
      this.bouteille = data.data;
      this.bouteille.quantite = this.quantite;
      this.bouteille.quantite = 1;

      let updateBouteille: Imesbouteilles = this.bouteille;
      console.log(updateBouteille);

      this.fetchService.modifBouteille(this.id, updateBouteille).subscribe((retour) => {
        console.log(this.bouteille.quantite);
        this.itemArchive.emit();
      });
    });
  }

  archiver() {
    this.openSnackBar('Bouteille archivée avec succès', 'Fermer')
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
