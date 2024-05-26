chrome.runtime.onInstalled.addListener(() => {
    chrome.contextMenus.create({
      id: 'saveWord',
      title: 'Save Word',
      contexts: ['selection']
    });
  });
  
  chrome.contextMenus.onClicked.addListener((info, tab) => {
    if (info.menuItemId === 'saveWord' && info.selectionText) {
      chrome.tabs.sendMessage(tab.id, { word: info.selectionText });
    }
  });