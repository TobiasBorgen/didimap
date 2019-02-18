import { Component, ViewChild } from '@angular/core';
import { NavController, AlertController } from 'ionic-angular';
import * as Tesseract from 'tesseract.js'
import {Camera, PictureSourceType} from '@ionic-native/camera';
import { ActionSheetController } from 'ionic-angular';
import { HTTP } from '@ionic-native/http';
import { PopoverController } from 'ionic-angular';
import { MyPopOverPage } from './my-pop-over';


@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  @ViewChild("newFood") newFood;
  @ViewChild("checked") checked;
  @ViewChild("additionalIngredients") additionalIngredients;

  selectedImage: string;
  imageText: string;
  all_info = [];
  index = 0;
  not_found: boolean;

  constructor(public navCtrl: NavController, private camera: Camera, private actionSheetCtrl: ActionSheetController, private http: HTTP, public popoverCtrl: PopoverController, public alertCtrl: AlertController) {
  }

  btnColor(t) {
    const red_index = Object.values(t).includes('high')
    const orange_index = Object.values(t).includes('moderate')
    const black_index = Object.values(t).includes('unknown')
    const green_index = Object.values(t).includes('low')

    let percentage = Object.values(t)[3]/(Object.values(t)[2]+Object.values(t)[3]);
    console.log(Object.values(t)[2]);
    if (red_index)
      return 'red'
    else if (orange_index)
      return 'orange'
    else if (black_index)
      return 'dark'
    else if (green_index)
      return 'green'
    else{
      if (percentage<=0.25)
        return 'red'
      else if (percentage<=0.75)
        return 'orange'
      else
        return 'green'
    }

  }

  showAlert(title, subTitle) {
    const alert = this.alertCtrl.create({
      title: title,
      subTitle: subTitle,
      buttons: ['OK']
    });
    alert.present();
  }

  showPrompt() {
    const prompt = this.alertCtrl.create({
      title: 'New Ingredient',
      message: "Enter a food you want to add",
      inputs: [
        {
          name: 'Food',
          placeholder: 'Name of food'
        },
      ],
      buttons: [
        {
          text: 'Cancel',
          handler: data => {
            console.log('Cancel clicked');
          }
        },
        {
          text: 'Save',
          handler: data => {
            //let body = {
              //food: data

            //}


            /*console.log('Saved clicked');
            this.http.post('http://localhost:3000/api/v1/check_fodmaps/addingredientsconsumerdatabase', body, {})
              .then(data => {
                console.log(data.status);
                console.log(data.data);
                console.log(data.headers);

              });*/
          }
        }
      ]
    });
    prompt.present();
  }

  presentPopover(ingredientInfo) {
    //console.log(this.index);
    const popover = this.popoverCtrl.create(MyPopOverPage, {key1:ingredientInfo});
    //this.index +=1;
    popover.present();
  }

  selectSource() {
    let actionSheet = this.actionSheetCtrl.create({
      buttons: [
        {
          text: 'Use Library',
          handler: () => {
            this.getPicture(this.camera.PictureSourceType.PHOTOLIBRARY);
          }
        }, {
          text: 'Capture Image',
          handler: () => {
            this.getPicture(this.camera.PictureSourceType.CAMERA);
          }
        }, {
          text: 'Cancel',
          role: 'cancel'
        }
      ]
    });
    actionSheet.present();
  }

  getPicture(sourceType: PictureSourceType) {
    this.camera.getPicture({
      quality: 100,
      destinationType: this.camera.DestinationType.DATA_URL,
      sourceType: sourceType,
      allowEdit: true,
      saveToPhotoAlbum: false,
      correctOrientation: true
    }).then((imageData) => {
      this.selectedImage = `data:image/jpeg;base64,${imageData}`;
    });
  }

  recognizeImage() {
    Tesseract.recognize(this.selectedImage,{lang: 'nor'})
    .catch(err => console.error(err))
    .then(result => {
      this.imageText = result.text;
    });
  }

  checkIngredients() {
    if(this.additionalIngredients.value!="") {
      this.imageText = this.imageText + ', ' + this.additionalIngredients.value;
    }
    let body = {
      imageText: this.imageText
    }

    console.log(this.imageText);


    this.http.post('http://localhost:3000/api/v1/check_fodmaps/checkingredients', body, {})
      .then(data => {
        //console.log(data.status);
        //console.log(data.data);
        //console.log(data.headers);

        let tmp = JSON.parse(data.data);
        this.all_info = tmp;

        for (let entry of tmp){

          if(Object.values(entry).includes('unknown')){
            this.not_found=true;
            this.showAlert("Ingredient not found", "An ingredient was not found in the database, please check the consumer database");
          }
        }


      })
      .catch(error => {

        if(error.status == 404){
          this.not_found=true;
          this.showAlert("Ingredient not found", "Ingredient was not found in the database, please try the consumer database");
        }

      });
  }

  checkIngredientsConsumerDatabase() {

    let not_found_food = ""
    for (let t of this.all_info) {
      if (Object.values(t).includes('unknown')) {
        if (not_found_food!="")
          not_found_food = not_found_food + ', ' + t.food
        else
          not_found_food = t.food
      }
    }
    let body = {
      imageText: not_found_food
    }


    this.http.post('http://localhost:3000/api/v1/check_fodmaps/checkingredientsconsumerdatabase', body, {})
      .then(data => {
        //console.log(data.status);
        //console.log(data.data);
        //console.log(data.headers);

        let tmp = JSON.parse(data.data);
        console.log(this.all_info)
        for (let entry of tmp){
          //this.all_info = tmp;
          //console.log(entry);
          let i=0;
          for (let index of this.all_info) {
            //console.log(index);
            if (Object.values(index).includes(entry.food)) {
              console.log(index);
              this.all_info[i] = entry;
            }
            i++;
          }
        }
        //console.log(this.all_info);


        //JSON.stringify(this.ingredientInfo);
      })
      .catch(error => {

        if(error.status == 404){
          this.showAlert("Ingredient not found", "Ingredient was not found in the database");        }
      });
  }

  addIngredientToConsumerDatabase() {
    let body = {
      food: this.newFood.value,
      symptoms: this.checked.value

    }


    this.http.post('http://localhost:3000/api/v1/check_fodmaps/addingredientsconsumerdatabase', body, {})
      .then(data => {
        console.log(data.status);
        console.log(data.data);
        console.log(data.headers);
        if(data.data=="{\"success\":\"Ingredient added\"}")
          this.showAlert("Ingredient added", "The ingredient has been added to the consumer database");
        if(data.data=="{\"success\":\"Vote recorded\"}")
          this.showAlert("Vote recorded", "Your vote concerning whether this food produces symptoms has been recorded");

      });

    this.newFood.value="";
    this.checked.value="false";
  }
}
