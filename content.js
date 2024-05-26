chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
    if (message.word) {
      const word = message.word;
      const meaning = prompt(`Enter meaning for "${word}"`);
      if (meaning) {
        chrome.storage.local.get({ words: [] }, (result) => {
          const words = result.words;
          words.push({ word, meaning });
          chrome.storage.local.set({ words }, () => {
            console.log(`Saved: ${word} - ${meaning}`);
            localStorage.setItem('words', JSON.stringify(words)); // Flutter uygulamasıyla senkronize etmek için
          });
        });
      }
    }
  });
  