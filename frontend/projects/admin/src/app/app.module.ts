import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { EnteteComponent } from './entete/entete.component';
import { ListeUsagerComponent } from './liste-usager/liste-usager.component';
import { ListeCatalogueComponent } from './liste-catalogue/liste-catalogue.component';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatTableModule } from '@angular/material/table';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatDialogModule } from '@angular/material/dialog';
import { MatSortModule } from '@angular/material/sort';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatDividerModule } from '@angular/material/divider';
import { AjoutAdminComponent } from './ajout-admin/ajout-admin.component';
import { ModalComponent } from './modal/modal.component';
import { ConnexionAdminComponent } from './connexion-admin/connexion-admin.component';
import { MatProgressBarModule} from '@angular/material/progress-bar';
import { MatBadgeModule} from '@angular/material/badge';
import  {MatSnackBar, MatSnackBarRef} from '@angular/material/snack-bar';
import { StatistiquesComponent } from './components/statistiques/statistiques.component';
import { ChartModule } from 'angular-highcharts';
import { NgxScannerQrcodeModule } from 'ngx-scanner-qrcode';
import { DefaultModule } from './layouts/default/default.module';
import { HeaderComponent } from './shared/components/header/header.component';
import { FooterComponent } from './shared/components/footer/footer.component';
import { SidebarComponent } from './shared/components/sidebar/sidebar.component';

@NgModule({
  declarations: [
    AppComponent,
    EnteteComponent,
    ListeUsagerComponent,
    ListeCatalogueComponent,
    AjoutAdminComponent,
    ModalComponent,
    ConnexionAdminComponent,
    StatistiquesComponent,
    HeaderComponent,
    FooterComponent,
    SidebarComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    FormsModule,
    ReactiveFormsModule,
    MatButtonModule,
    MatIconModule,
    MatToolbarModule,
    MatTableModule,
    MatFormFieldModule,
    MatInputModule,
    MatSnackBarModule,
    MatDialogModule,
    MatSortModule,
    MatSidenavModule,
    MatDividerModule,
    MatProgressBarModule,
    MatBadgeModule,
    ChartModule,
    BrowserModule,
    NgxScannerQrcodeModule,
    DefaultModule
  ],
  providers: [
  ],
  bootstrap: [AppComponent]
})
export class AppModule {

}
