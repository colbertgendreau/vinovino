import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ArchiverBouteilleModalComponent } from './archiver-bouteille-modal.component';

describe('ArchiverBouteilleModalComponent', () => {
  let component: ArchiverBouteilleModalComponent;
  let fixture: ComponentFixture<ArchiverBouteilleModalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ArchiverBouteilleModalComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ArchiverBouteilleModalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
