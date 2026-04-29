const express = require("express");
const router = express.Router();
const User = require("../models/User");

// Get all saved items for a user
router.get("/:userId", async (req, res) => {
  try {
    const user = await User.findById(req.params.userId);
    if (!user) return res.status(404).json({ message: "User not found" });

    res.json({
      savedTrails: user.savedTrails,
      savedAttractions: user.savedAttractions,
      savedFood: user.savedFood,
    });
  } catch (err) {
    res.status(500).json({ message: "Server error", error: err.message });
  }
});

// Toggle a saved trail
router.post("/:userId/trail", async (req, res) => {
  try {
    const { name } = req.body;
    const user = await User.findById(req.params.userId);
    if (!user) return res.status(404).json({ message: "User not found" });

    if (user.savedTrails.includes(name)) {
      user.savedTrails = user.savedTrails.filter((t) => t !== name);
    } else {
      user.savedTrails.push(name);
    }
    await user.save();
    res.json({ savedTrails: user.savedTrails });
  } catch (err) {
    res.status(500).json({ message: "Server error", error: err.message });
  }
});

// Toggle a saved attraction
router.post("/:userId/attraction", async (req, res) => {
  try {
    const { name } = req.body;
    const user = await User.findById(req.params.userId);
    if (!user) return res.status(404).json({ message: "User not found" });

    if (user.savedAttractions.includes(name)) {
      user.savedAttractions = user.savedAttractions.filter((a) => a !== name);
    } else {
      user.savedAttractions.push(name);
    }
    await user.save();
    res.json({ savedAttractions: user.savedAttractions });
  } catch (err) {
    res.status(500).json({ message: "Server error", error: err.message });
  }
});

// Toggle a saved food venue
router.post("/:userId/food", async (req, res) => {
  try {
    const { name } = req.body;
    const user = await User.findById(req.params.userId);
    if (!user) return res.status(404).json({ message: "User not found" });

    if (user.savedFood.includes(name)) {
      user.savedFood = user.savedFood.filter((f) => f !== name);
    } else {
      user.savedFood.push(name);
    }
    await user.save();
    res.json({ savedFood: user.savedFood });
  } catch (err) {
    res.status(500).json({ message: "Server error", error: err.message });
  }
});

module.exports = router;