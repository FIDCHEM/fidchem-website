// FIDCHEM main.js

// ── Mobile nav toggle ──
const burger = document.getElementById('nav-burger');
const navLinks = document.getElementById('nav-links');
if (burger && navLinks) {
  burger.addEventListener('click', () => {
    navLinks.classList.toggle('open');
  });
  // Close on link click
  navLinks.querySelectorAll('a').forEach(a => {
    a.addEventListener('click', () => navLinks.classList.remove('open'));
  });
}

// ── Nav scroll effect ──
const nav = document.getElementById('site-nav');
if (nav) {
  window.addEventListener('scroll', () => {
    nav.style.borderBottomColor = window.scrollY > 20
      ? 'rgba(13,17,23,0.18)'
      : 'rgba(13,17,23,0.11)';
  }, { passive: true });
}

// ── AI Chat widget (demo fallback) ──
// Replace this entire block when you embed the real AI widget
const sendBtn = document.getElementById('chat-send-btn');
const chatInput = document.getElementById('chat-input-field');
const chatWindow = document.querySelector('.chat-window');

if (sendBtn && chatInput && chatWindow) {
  function addMessage(text, role) {
    const msg = document.createElement('div');
    msg.className = 'chat-msg ' + role;
    msg.innerHTML = `
      <div class="chat-msg-label">${role === 'ai' ? 'FIDCHEM AI' : 'You'}</div>
      <div class="chat-msg-text">${text}</div>
    `;
    chatWindow.appendChild(msg);
    chatWindow.scrollTop = chatWindow.scrollHeight;
  }

  function handleSend() {
    const text = chatInput.value.trim();
    if (!text) return;
    addMessage(text, 'user');
    chatInput.value = '';
    sendBtn.disabled = true;

    // Redirect to WhatsApp with the message pre-filled
    // (Until real AI API is connected)
    setTimeout(() => {
      const waUrl = `https://wa.me/34600934899?text=${encodeURIComponent(text)}`;
      addMessage(
        'Thank you! To get a full technical consultation, please continue this conversation on WhatsApp with our engineers. <a href="' + waUrl + '" target="_blank" style="color:var(--accent)">Open WhatsApp →</a>',
        'ai'
      );
      sendBtn.disabled = false;
    }, 800);
  }

  sendBtn.addEventListener('click', handleSend);
  chatInput.addEventListener('keydown', e => {
    if (e.key === 'Enter') handleSend();
  });
}

// ── Smooth anchor links ──
document.querySelectorAll('a[href^="#"]').forEach(a => {
  a.addEventListener('click', e => {
    const target = document.querySelector(a.getAttribute('href'));
    if (target) {
      e.preventDefault();
      const offset = 70;
      window.scrollTo({ top: target.offsetTop - offset, behavior: 'smooth' });
    }
  });
});
