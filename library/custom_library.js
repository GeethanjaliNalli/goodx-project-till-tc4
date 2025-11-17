async function isElementVisible(locator, page, logger) {
    logger(`Checking visibility of locator: ${locator}`);

    const handle = await page.$(locator);

    if (!handle) {
        logger("Element not found.");
        return false;
    }

    const visible = await handle.isVisible();
    logger("Element visible: " + visible);

    return visible;
}

isElementVisible.rfdoc = "Check if an element is visible using a locator. Returns true/false.";
exports.__esModule = true;
exports.isElementVisible = isElementVisible;
