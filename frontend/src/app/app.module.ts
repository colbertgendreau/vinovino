import { BrowserModule } from '@angular/platform-browser';
import { NgModule, isDevMode } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SigninComponent } from './compte-utilisateur/signin/signin.component';
import { SignupComponent } from './compte-utilisateur/signup/signup.component';
import { UserProfileComponent } from './compte-utilisateur/user-profile/user-profile.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { AuthInterceptor } from './shared/auth.interceptor';
import { EnteteComponent } from './entete/entete.component';
import { AccueilComponent } from './accueil/accueil.component';
import { CellierComponent } from './cellier/cellier.component';
import { ListeCellierComponent } from './liste-cellier/liste-cellier.component';
import { AjoutBouteilleComponent } from './ajout-bouteille/ajout-bouteille.component';
import { ModifBouteilleComponent } from './modif-bouteille/modif-bouteille.component';
import { ModifCellierComponent } from './modif-cellier/modif-cellier.component';
import { AjoutCellierComponent } from './ajout-cellier/ajout-cellier.component';
import { MesBouteillesComponent } from './mes-bouteilles/mes-bouteilles.component';
import { ListeMesbouteillesComponent } from './liste-mesbouteilles/liste-mesbouteilles.component';
import { RechercheComponent } from './recherche/recherche.component';
import { EffacerBouteilleModalComponent } from './effacer-bouteille-modal/effacer-bouteille-modal.component';
import { EffacerModalComponent } from './effacer-cellier-modal/effacer-cellier-modal.component';
import { SpinnerComponent } from './spinner/spinner.component';
import { FooterComponent } from './footer/footer.component';

import Quagga from 'quagga';


// import { ServiceWorkerModule } from '@angular/service-worker';

import { MatSnackBarModule } from '@angular/material/snack-bar';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { environment } from '../environments/environment';
import { ScannerComponent } from './scanner/scanner.component';



@NgModule({
  declarations: [
    AppComponent,
    SigninComponent,
    SignupComponent,
    UserProfileComponent,
    EnteteComponent,
    AccueilComponent,
    CellierComponent,
    ListeCellierComponent,
    AjoutBouteilleComponent,
    ModifBouteilleComponent,
    ModifCellierComponent,
    AjoutCellierComponent,
    MesBouteillesComponent,
    ListeMesbouteillesComponent,

    EffacerModalComponent,


    RechercheComponent,

    EffacerBouteilleModalComponent,

    SpinnerComponent,

    FooterComponent,
    ScannerComponent,



  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule,
    MatSnackBarModule,
    BrowserAnimationsModule,
    // ServiceWorkerModule.register('ngsw-worker.js', {
    //   enabled: environment.production,
    //   // Register the ServiceWorker as soon as the application is stable
    //   // or after 30 seconds (whichever comes first).
    //   registrationStrategy: 'registerWhenStable:30000'
    // }),
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptor,
      multi: true,
    },
    { provide: Quagga, useValue: Quagga },
  ],
  bootstrap: [AppComponent],
})
export class AppModule { }
