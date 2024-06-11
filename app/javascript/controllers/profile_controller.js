import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
    connect() {
        console.log("Profile controller connected");
    }

    displayFileName(event) {
        console.log("File input changed");
        const input = event.target;
        if (input.files && input.files.length > 0) {
            const fileName = input.files[0].name;
            console.log("File name: ", fileName);
            const fileNameElement = document.getElementById('file-name');
            fileNameElement.textContent = fileName;
        }
    }
}
