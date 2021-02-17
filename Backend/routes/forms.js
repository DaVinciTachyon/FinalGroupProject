const router = require('express').Router();

router.use(function(req, res, next) {
	next();
});

router.post('/', (req, res) => {

})

router.get('/', (req, res) => {
    
})

module.exports = router;