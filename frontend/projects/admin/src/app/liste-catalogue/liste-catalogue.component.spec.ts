import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListeCatalogueComponent } from './liste-catalogue.component';

describe('ListeCatalogueComponent', () => {
  let component: ListeCatalogueComponent;
  let fixture: ComponentFixture<ListeCatalogueComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListeCatalogueComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ListeCatalogueComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
