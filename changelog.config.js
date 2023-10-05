module.exports = {
  disableEmoji: true,
  format: '{type}{scope}: {emoji}{subject}',
  list: ['feat', 'fix', 'chore'],
  maxMessageLength: 64,
  minMessageLength: 3,
  questions: ['type', 'scope', 'subject'],
  scopes: [
    '2021 ましゅまろ',
    '2021 せんべい',
    '2021 かつおぶし',
    '2020 ましゅまろ',
    '2020 せんべい',
    '2020 かつおぶし',
    '2019 ましゅまろ',
    '2019 せんべい',
    '2019 かつおぶし',

  ],
  types: {
    chore: {
      description: 'Build process or auxiliary tool changes',
      emoji: '🤖',
      value: 'chore'
    },
    feat: {
      description: 'A new feature',
      emoji: '🎸',
      value: 'feat'
    },
    fix: {
      description: 'A bug fix',
      emoji: '🐛',
      value: 'fix'
    },
    messages: {
      type: 'Select the type of change that you\'re committing:',
      customScope: 'Select the scope this component affects:',
      subject: 'Write a short, imperative mood description of the change:\n',
    },
  }
};
