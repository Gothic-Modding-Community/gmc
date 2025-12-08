/**
 * Typed Headers TOC Enhancement
 * Applies type styling to TOC links for headers flagged with .typed and type classes
 */

document.addEventListener('DOMContentLoaded', function() {
    const types = ['float', 'int', 'string', 'func', 'class', 'class-builtin', 'class-custom'];
    
    // Find all headers with typed flag
    const typedHeaders = document.querySelectorAll('h3.typed, h4.typed, h5.typed, h6.typed');
    
    typedHeaders.forEach(header => {
        // Determine which type this header has
        const headerType = types.find(t => header.classList.contains(t));
        if (!headerType) return;
        
        // Get header text to match with TOC
        const headerText = header.textContent.trim();
        
        // Find all TOC links and match by text content
        const allTocLinks = document.querySelectorAll('.md-nav__link');
        
        allTocLinks.forEach(link => {
            const linkText = link.textContent.trim();
            
            // Match if link text equals or starts with header text
            if (linkText === headerText || linkText.startsWith(headerText)) {
                // Check if already has a code tag
                let codeTag = link.querySelector('code');
                
                if (!codeTag) {
                    // Extract first word
                    const words = linkText.split(/\s+/);
                    if (words.length === 0) return;
                    
                    const firstWord = words[0];
                    
                    // Create code tag
                    codeTag = document.createElement('code');
                    codeTag.textContent = firstWord;
                    
                    // Replace link content
                    link.innerHTML = '';
                    link.appendChild(codeTag);
                    
                    // Add remaining text
                    if (words.length > 1) {
                        link.appendChild(document.createTextNode(' ' + words.slice(1).join(' ')));
                    }
                }
                
                // Apply type class as a data attribute instead of class to avoid ID changes
                codeTag.setAttribute('data-type', headerType);
            }
        });
    });
});
