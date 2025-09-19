import { Github, Twitter, Users, Linkedin } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { useTranslation } from "react-i18next";
import useTeamMembers from "@/features/team/hooks/useTeamMembers";
import useLandingBlockCopy from "@/features/pages/hooks/useLandingBlockCopy";
import { assetUrl } from "@/lib/directus";
import { FocusCards } from "@/components/ui/focus-cards";
import { Skeleton } from "@/components/ui/skeleton";
// import { DirectionAwareHover } from "@/components/ui/direction-aware-hover";

type Member = {
  name: string;
  role?: string;
  image?: string;
  bio?: string;
  social?: { twitter?: string; github?: string; linkedin?: string };
};

// no placeholders; hide section when team data is unavailable

const Team4 = () => {
  const { t } = useTranslation();
  const { members: team, loading } = useTeamMembers();
  const copy = useLandingBlockCopy('team');
  const dpr = typeof window !== 'undefined' ? Math.min(window.devicePixelRatio || 1, 2.5) : 2
  const baseSize = 480 // render larger for clarity; FocusCards height is ~352px
  const target = Math.round(baseSize * dpr)
  const members: Member[] =
    team.length > 0
      ? team.map((m) => ({
          name: m.name,
          role: m.title,
          bio: m.description,
          image: m.avatarId
            ? assetUrl(m.avatarId, { width: target, height: target, fit: 'cover', quality: 90, format: 'webp' })
            : undefined,
          social: { twitter: m.twitter, linkedin: m.linkedin },
        }))
      : [];

  return (
    <section className="py-32">
      <div className="container">
        <div className="flex flex-col gap-6 py-4 lg:py-8">
          <Badge variant="outline" className="w-fit gap-1 bg-card px-3 text-sm font-normal tracking-tight shadow-sm">
            <Users className="size-4" />
            <span>{t('team.badge')}</span>
          </Badge>
          <h2 className="text-3xl leading-tight tracking-tight md:text-4xl lg:text-6xl">{copy?.heading || t('team.heading')}</h2>
          <p className="max-w-[600px] tracking-[-0.32px] text-muted-foreground">{copy?.subheading || t('team.subheading')}</p>
        </div>

        {loading ? (
          <div className="md:mt-14 mt-10">
            <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
              {[0,1,2].map((i) => (
                <Skeleton key={i} className="h-[22rem] w-full rounded-2xl" />
              ))}
            </div>
            <div className="mt-10 grid gap-x-12 gap-y-8 sm:grid-cols-2 lg:grid-cols-3">
              {[0,1,2].map((i) => (
                <div key={`meta-${i}`} className="flex flex-col gap-2">
                  <Skeleton className="h-6 w-40" />
                  <Skeleton className="h-4 w-32" />
                  <Skeleton className="mt-3 h-4 w-full" />
                  <Skeleton className="h-4 w-3/4" />
                </div>
              ))}
            </div>
          </div>
        ) : members.length > 0 ? (
          <div className="md:mt-14 mt-10">
            <FocusCards
              blurClass="blur-[0.5px]"
              cards={members.map((m) => ({ title: m.name, subtitle: m.role, src: m.image || '' }))}
            />
            <div className="mt-10 grid gap-x-12 gap-y-16 sm:grid-cols-2 lg:grid-cols-3">
              {members.map((member) => (
                <div key={`${member.name}-meta`} className="flex flex-col tracking-[-0.32px]">
                  <h3 className="text-xl font-semibold">{member.name}</h3>
                  {member.role ? <p className="text-muted-foreground-subtle">{member.role}</p> : null}
                  {member.bio ? (
                    <p className="mt-4 text-sm tracking-[-0.36px] text-muted-foreground whitespace-pre-wrap">{member.bio}</p>
                  ) : null}
                  <div className="mt-4 flex gap-2">
                    {member.social?.linkedin && (
                      <a href={member.social.linkedin} className="hover:text-foreground" target="_blank" rel="noreferrer">
                        <Linkedin />
                      </a>
                    )}
                    {member.social?.twitter && (
                      <a href={member.social.twitter} className="hover:text-foreground">
                        <Twitter />
                      </a>
                    )}
                    {member.social?.github && (
                      <a href={member.social.github} className="hover:text-foreground">
                        <Github />
                      </a>
                    )}
                  </div>
                </div>
              ))}
            </div>
          </div>
        ) : null}
      </div>
    </section>
  );
};

export { Team4 };
