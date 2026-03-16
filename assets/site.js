document.addEventListener("DOMContentLoaded", () => {
  const storageKey = "swiftui-study-language";
  const languageButtons = Array.from(document.querySelectorAll("[data-lang-button]"));
  const i18nNodes = Array.from(document.querySelectorAll("[data-i18n]"));
  const localizedBlocks = Array.from(document.querySelectorAll("[data-lang-content]"));
  const descriptionMeta = document.querySelector('meta[name="description"]');
  const titleMap = {
    en: document.body.dataset.titleEn,
    ko: document.body.dataset.titleKo,
  };

  const detectLanguage = () => {
    try {
      const saved = window.localStorage.getItem(storageKey);
      if (saved === "en" || saved === "ko") {
        return saved;
      }
    } catch (error) {
      // Ignore storage access failures and fall back to browser preferences.
    }

    return navigator.language && navigator.language.toLowerCase().startsWith("ko") ? "ko" : "en";
  };

  const setTextLanguage = (lang) => {
    i18nNodes.forEach((node) => {
      const value = node.dataset[lang];
      if (typeof value === "string") {
        node.textContent = value;
      }
    });
  };

  const setBlockLanguage = (lang) => {
    localizedBlocks.forEach((block) => {
      const isActive = block.dataset.langContent === lang;
      block.hidden = !isActive;
    });
  };

  const setPageLanguage = (lang) => {
    document.documentElement.lang = lang;

    if (titleMap[lang]) {
      document.title = titleMap[lang];
    }

    if (descriptionMeta) {
      const description = descriptionMeta.dataset[lang];
      if (typeof description === "string" && description.length > 0) {
        descriptionMeta.setAttribute("content", description);
      }
    }

    languageButtons.forEach((button) => {
      const isActive = button.dataset.langButton === lang;
      button.classList.toggle("is-active", isActive);
      button.setAttribute("aria-pressed", String(isActive));
    });

    setTextLanguage(lang);
    setBlockLanguage(lang);

    try {
      window.localStorage.setItem(storageKey, lang);
    } catch (error) {
      // Ignore storage access failures after updating the page.
    }
  };

  const initialLanguage = detectLanguage();

  languageButtons.forEach((button) => {
    button.addEventListener("click", () => {
      setPageLanguage(button.dataset.langButton);
    });
  });

  setPageLanguage(initialLanguage);

  const revealTargets = document.querySelectorAll("[data-reveal]");

  if ("IntersectionObserver" in window) {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible");
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.12 });

    revealTargets.forEach((target) => observer.observe(target));
  } else {
    revealTargets.forEach((target) => target.classList.add("is-visible"));
  }

  const buttons = Array.from(document.querySelectorAll("[data-filter]"));
  const cards = Array.from(document.querySelectorAll("[data-session-card]"));

  if (!buttons.length || !cards.length) {
    return;
  }

  buttons.forEach((button) => {
    button.addEventListener("click", () => {
      const selected = button.dataset.filter;

      buttons.forEach((item) => item.classList.toggle("is-active", item === button));
      cards.forEach((card) => {
        const matches = selected === "all" || card.dataset.track === selected;
        card.classList.toggle("is-hidden", !matches);
      });
    });
  });
});
