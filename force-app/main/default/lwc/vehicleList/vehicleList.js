import {
    LightningElement,
    api,
    wire,
    track
} from 'lwc';

import {
    refreshApex
} from '@salesforce/apex';

import {
    updateRecord
} from 'lightning/uiRecordApi';
import getVehicleData from '@salesforce/apex/AccountLWCController.getVehicleData';


export default class VehicleList extends LightningElement {
    @api vehicleId;

    vehicleListResult

    @track vehicle;

    @wire(getVehicleData, {
        vehiclesId: '$vehicleId'
    }) wiregetVehicleData(result) {
        this.vehicleListResult = result;

        const {
            data,
            error
        } = result;

        if (data) {
            console.log('getVehicleData start')
            this.errorMsg = undefined;
            console.log(data, this.vehicleId)
            this.vehicle = data.find(item => item.Id === this.vehicleId);
            console.log('getVehicleData end')
        } else {
            this.errorMsg = error;
            this.vehicle = undefined;
        }
    }

    handleChange(event) {
        console.log('update');

        let vehicleToChange = {
            fields: {
                I_Like_It__c: event.target.checked,
                Id: event.target.value
            }
        };

        updateRecord(vehicleToChange)
            .then(() => {
                console.log('Updated');
                return refreshApex(this.vehicleListResult)
            })
            .catch((error) => {
                console.error(JSON.stringify(error));
            });





    }
}