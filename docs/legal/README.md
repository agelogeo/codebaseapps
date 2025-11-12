# Legal Pages for OCC App

This folder contains HTML versions of the Privacy Policy and Terms of Service pages that can be used on your company website.

## Files

- `privacy-policy.html` - Complete Privacy Policy page
- `terms-of-service.html` - Complete Terms of Service page  
- `legal-styles.css` - Shared CSS styling for both pages

## Features

✅ **Responsive Design** - Works on desktop, tablet, and mobile
✅ **Dark Mode Support** - Automatically adapts to user's system preference
✅ **Print Friendly** - Optimized for printing with clean layouts
✅ **Accessibility** - Proper heading structure and focus indicators
✅ **Professional Styling** - Clean, modern design matching OCC app branding

## Usage

### Option 1: Standalone Pages
Upload the HTML files and CSS to your web server and link to them directly.

### Option 2: Embed in Existing Website
Copy the content from the `<main>` section of each HTML file and integrate into your website's template.

### Option 3: API/CMS Integration
Extract the text content and store it in your CMS or database for dynamic rendering.

## Customization

### Brand Colors
The CSS uses OCC's brand color (`#2f66f6`). Update this in `legal-styles.css` to match your website:

```css
/* Change brand blue to your color */
.legal-footer {
    background-color: rgba(47, 102, 246, 0.05); /* Your color here */
}
```

### Typography
The font stack is set to system fonts for best performance:
```css
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', system-ui, sans-serif;
```

### Contact Information
Update the contact email `contact@codebaseapps.com` in both HTML files to your actual support email.

## Content Updates

The content is extracted from the English translations in the OCC app. To update:

1. Modify the translation keys in `lib/i18n/app_translations.dart` 
2. Re-export using this generator script
3. Update the HTML files with new content

## Last Updated
September 2025 - Make sure to update the "Last updated" date when content changes.

## Multi-language Support

This export includes only English content. For multi-language support on your website, you can:

1. Create separate files for each language (privacy-policy-el.html, etc.)
2. Extract the Greek, German, and French translations from the app
3. Use your website's i18n system to serve appropriate language versions

## Legal Compliance

These pages are designed to be compliant with:
- GDPR (European Union)
- CCPA (California)
- General privacy law requirements

**Important**: Have these reviewed by legal counsel before publishing on your website.