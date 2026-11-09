<script setup lang="ts">
import { ref } from 'vue'
import { ArrowUpRight, Copy, Check, Github, Instagram, Mail } from 'lucide-vue-next'

const email = 'mail@axelproeger.de'
const isCopied = ref(false)

const projects = [
  {
    title: 'nordrock.live',
    url: 'https://nordrock.live',
    category: 'Concert Calendar',
    description:
      'Northern Germany concert calendar for rock, metal & punk. Automated event scraper and live gig calendar.',
    logo: '/images/nordrock-logo.svg',
  },
  {
    title: 'beyondkick.com',
    url: 'https://beyondkick.com',
    category: 'Combat Sports Media',
    description:
      'Global digital media platform for professional kickboxing news, athlete rankings and event schedule.',
    logo: '/images/beyondkick-logo.svg',
  },
  {
    title: 'edelmetalkontor-nord.de',
    url: 'https://edelmetalkontor-nord.de',
    category: 'Non-Profit Culture',
    description:
      'Non-profit cultural association supporting local festivals and bands with promotion, volunteer crew, and live concerts.',
    logo: '/images/edelmetal-logo.svg',
  },
  {
    title: 'lfgz.de',
    url: 'https://lfgz.de',
    category: 'DIY Festival',
    description:
      'Non-profit cultural association organizing an annual independent DIY music and arts festival.',
    logo: '/images/lfgz-logo.svg',
  },
  {
    title: 'svenlind.de',
    url: 'https://svenlind.de',
    category: 'Care & Science Archive',
    description:
      'Specialist gerontology archive and dementia care publications for clinical psychologist Dr. Sven Lind.',
    logoText: 'SL',
  },
]

const toolbox = [
  {
    area: 'Frontend Architecture',
    tools: 'Vue 3, Nuxt 4, TypeScript, Tailwind CSS, Vite',
  },
  {
    area: 'Backend & Data',
    tools: 'Node.js, PostgreSQL, Supabase, Redis, REST APIs',
  },
  {
    area: 'Platforms & Operations',
    tools: 'Docker, Coolify, Ubuntu, Nginx, WordPress',
  },
]

async function copyEmail() {
  try {
    if (navigator?.clipboard?.writeText) {
      await navigator.clipboard.writeText(email)
    } else {
      const el = document.createElement('textarea')
      el.value = email
      document.body.appendChild(el)
      el.select()
      document.execCommand('copy')
      document.body.removeChild(el)
    }
    isCopied.value = true
    setTimeout(() => {
      isCopied.value = false
    }, 2000)
  } catch {
    window.location.href = `mailto:${email}`
  }
}
</script>

<template>
  <div
    class="min-h-screen bg-[#F8CC67] text-[#201A1A] selection:bg-[#201A1A] selection:text-[#F8CC67] flex flex-col justify-between font-sans"
  >
    <!-- Editorial Masthead Header -->
    <header
      class="w-full max-w-4xl mx-auto px-6 sm:px-12 lg:px-20 pt-8 sm:pt-14 pb-8 border-b-2 border-[#201A1A]"
    >
      <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-6">
        <!-- Author Identity -->
        <div class="flex items-center gap-4">
          <img
            src="/images/avatar-axel.webp"
            alt="Axel Pröger"
            class="w-14 h-14 sm:w-16 sm:h-16 rounded-full object-cover border-2 border-[#201A1A] shadow-sm shrink-0"
          />
          <div>
            <div class="text-xl sm:text-2xl font-bold tracking-tight text-[#201A1A]">
              Axel Pröger
            </div>
            <div class="font-mono text-xs text-[#201A1A]/75 mt-1">Rendsburg, DE</div>
          </div>
        </div>

        <!-- Quick Access Contacts -->
        <div class="flex items-center gap-5 sm:gap-6 font-mono text-xs">
          <a
            href="https://github.com/aproeger"
            target="_blank"
            rel="noopener noreferrer"
            class="hover:text-[#dc2626] transition-colors flex items-center gap-1.5 font-bold text-[#201A1A]"
          >
            <Github class="w-4 h-4" />
            <span>GitHub</span>
          </a>
          <a
            href="https://instagram.com/axel.nordrock"
            target="_blank"
            rel="noopener noreferrer"
            class="hover:text-[#dc2626] transition-colors flex items-center gap-1.5 font-bold text-[#201A1A]"
          >
            <Instagram class="w-4 h-4" />
            <span>Instagram</span>
          </a>
          <button
            @click="copyEmail"
            aria-label="E-Mail-Adresse in Zwischenablage kopieren"
            class="hover:text-[#dc2626] transition-colors flex items-center gap-1.5 font-bold text-[#201A1A] cursor-pointer"
          >
            <Mail class="w-4 h-4" />
            <span>{{ isCopied ? 'Copied' : 'E-Mail' }}</span>
          </button>
        </div>
      </div>
    </header>

    <!-- Main Content Container -->
    <main class="w-full max-w-4xl mx-auto px-6 sm:px-12 lg:px-20 py-10 sm:py-16 space-y-16 flex-1">
      <!-- Hard Swiss Editorial Hero Statement -->
      <section class="space-y-4">
        <h1
          class="text-3xl sm:text-5xl lg:text-6xl font-bold tracking-tight text-[#201A1A] leading-[1.08] max-w-3xl"
        >
          Just a punk rock fan who builds websites in his spare time.
        </h1>
      </section>

      <!-- Selected Projects Ledger Table -->
      <section class="space-y-6">
        <div
          class="flex items-baseline justify-between border-b-2 border-[#201A1A] pb-2 font-mono text-xs"
        >
          <span class="font-bold text-[#201A1A]">Selected Work</span>
        </div>

        <div class="divide-y divide-[#201A1A]/20">
          <a
            v-for="project in projects"
            :key="project.title"
            :href="project.url"
            target="_blank"
            rel="noopener noreferrer"
            class="group block py-6 transition-colors duration-150"
          >
            <div class="flex items-start gap-4 sm:gap-6">
              <!-- Project Logo / Monogram Slot -->
              <div
                aria-hidden="true"
                class="w-14 h-14 sm:w-16 sm:h-16 rounded-xl bg-[#201A1A] border border-[#201A1A] p-2.5 flex items-center justify-center shrink-0 shadow-sm group-hover:scale-105 transition-transform overflow-hidden mt-0.5"
              >
                <img
                  v-if="project.logo"
                  :src="project.logo"
                  alt=""
                  class="w-full h-full object-contain"
                  loading="lazy"
                />
                <span v-else class="font-mono text-base font-bold text-[#F8CC67] tracking-wider">
                  {{ project.logoText }}
                </span>
              </div>

              <!-- Project Text Details -->
              <div class="flex-1 min-w-0">
                <div>
                  <div class="flex items-center gap-1.5">
                    <span
                      class="text-xl sm:text-2xl font-bold tracking-tight text-[#201A1A] group-hover:text-[#dc2626] transition-colors"
                    >
                      {{ project.title }}
                    </span>
                    <ArrowUpRight
                      class="w-4 h-4 text-[#201A1A]/40 group-hover:text-[#dc2626] group-hover:translate-x-0.5 group-hover:-translate-y-0.5 transition-all"
                    />
                  </div>

                  <!-- Red Category Text directly under the Website Name -->
                  <div class="font-mono text-xs sm:text-sm font-semibold text-[#dc2626] mt-0.5">
                    {{ project.category }}
                  </div>
                </div>

                <p
                  class="text-sm sm:text-base text-[#201A1A]/85 mt-2.5 leading-relaxed max-w-2xl font-normal"
                >
                  {{ project.description }}
                </p>
              </div>
            </div>
          </a>
        </div>
      </section>

      <!-- Toolbox & Capabilities Spec Section -->
      <section class="space-y-4 pt-4">
        <div class="border-b-2 border-[#201A1A] pb-2 font-mono text-xs font-bold text-[#201A1A]">
          Toolbox & Tech Stack
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-3 gap-6 pt-2">
          <div
            v-for="group in toolbox"
            :key="group.area"
            class="space-y-1.5 border-l-2 border-[#201A1A] pl-3.5"
          >
            <div class="font-mono text-xs font-bold text-[#dc2626]">
              {{ group.area }}
            </div>
            <div class="text-sm text-[#201A1A]/90 font-medium leading-relaxed">
              {{ group.tools }}
            </div>
          </div>
        </div>
      </section>
    </main>

    <!-- Editorial Footer -->
    <footer
      class="w-full max-w-4xl mx-auto px-6 sm:px-12 lg:px-20 pt-8 pb-12 sm:pb-16 border-t-2 border-[#201A1A]"
    >
      <div
        class="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-6 font-mono text-xs text-[#201A1A]/80"
      >
        <!-- Direct Email Interaction -->
        <div class="flex items-center gap-3">
          <Mail class="w-4 h-4 text-[#201A1A]" />
          <button
            @click="copyEmail"
            aria-label="E-Mail-Adresse in Zwischenablage kopieren"
            class="text-[#201A1A] font-bold hover:text-[#dc2626] transition-colors cursor-pointer flex items-center gap-1.5 font-mono"
          >
            <span>{{ email }}</span>
            <Check v-if="isCopied" class="w-3.5 h-3.5 text-[#201A1A]" />
            <Copy v-else class="w-3.5 h-3.5 opacity-60 hover:opacity-100" />
          </button>
          <span v-if="isCopied" class="text-[#dc2626] font-bold text-[11px]"> Copied </span>
        </div>

        <!-- Links and Imprint -->
        <div class="flex flex-wrap items-center gap-5 sm:gap-6">
          <a
            href="https://github.com/aproeger"
            target="_blank"
            rel="noopener noreferrer"
            class="flex items-center gap-1.5 text-[#201A1A] hover:text-[#dc2626] font-bold transition-colors"
          >
            <Github class="w-4 h-4" />
            <span>github.com/aproeger</span>
            <ArrowUpRight class="w-3 h-3 opacity-60" />
          </a>

          <a
            href="https://instagram.com/axel.nordrock"
            target="_blank"
            rel="noopener noreferrer"
            class="flex items-center gap-1.5 text-[#201A1A] hover:text-[#dc2626] font-bold transition-colors"
          >
            <Instagram class="w-4 h-4" />
            <span>@axel.nordrock</span>
            <ArrowUpRight class="w-3 h-3 opacity-60" />
          </a>
        </div>
      </div>
    </footer>
  </div>
</template>
