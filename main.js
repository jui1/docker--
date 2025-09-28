const express = require('express');
const app = express();
const PORT = 8080;

app.get('/', (req, res) => {
    res.json({ message: 'Hey! I am Node.js in a container' });
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
