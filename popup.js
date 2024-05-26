// popup.js

document.addEventListener('DOMContentLoaded', function() {
    var wordList = document.getElementById('wordList');
    var clearButton = document.getElementById('clearButton');

    // Kaydedilen kelimeleri al
    chrome.storage.local.get('savedWords', function(result) {
        var savedWords = result.savedWords || [];

        // Kaydedilen kelimeleri listele
        savedWords.forEach(function(word) {
            var listItem = document.createElement('li');
            listItem.textContent = word;
            wordList.appendChild(listItem);
        });
    });

    // Tüm kayıtları temizle
    clearButton.addEventListener('click', function() {
        chrome.storage.local.remove('savedWords', function() {
            wordList.innerHTML = ''; // Listeyi temizle
        });
    });
});
