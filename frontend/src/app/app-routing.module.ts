import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SigninComponent } from './compte-utilisateur/signin/signin.component';
import { SignupComponent } from './compte-utilisateur/signup/signup.component';
import { UserProfileComponent } from './compte-utilisateur/user-profile/user-profile.component';

import { GardienLoginGuard } from './gardien-login.guard';

import { EnteteComponent } from './entete/entete.component';
import { AccueilComponent } from './accueil/accueil.component';
import { CellierComponent } from './cellier/cellier.component';
import { ListeCellierComponent } from './liste-cellier/liste-cellier.component';
import { AjoutBouteilleComponent } from './ajout-bouteille/ajout-bouteille.component';
import { ModifBouteilleComponent } from './modif-bouteille/modif-bouteille.component';
import { ModifCellierComponent } from './modif-cellier/modif-cellier.component';
import { AjoutCellierComponent } from './ajout-cellier/ajout-cellier.component';

const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'login', component: SigninComponent },
  { path: 'register', component: SignupComponent },
  { path: 'profile', component: UserProfileComponent, canActivate:[GardienLoginGuard] },
  
  { path: 'accueil', component: AccueilComponent },
  { path: 'liste-cellier', component: ListeCellierComponent, canActivate:[GardienLoginGuard] },
  { path: 'cellier', component: CellierComponent, canActivate:[GardienLoginGuard] },
  { path: 'ajouter-bouteille', component: AjoutBouteilleComponent, canActivate:[GardienLoginGuard] },
  { path: 'modifier-bouteille', component: ModifBouteilleComponent, canActivate:[GardienLoginGuard] },
  { path: 'ajouter-cellier', component: AjoutCellierComponent, canActivate:[GardienLoginGuard] },
  { path: 'modifier-cellier', component: ModifCellierComponent, canActivate:[GardienLoginGuard] },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})

export class AppRoutingModule {}
