Return-Path: <linux-trace-users-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7248C61DA4
	for <linux-trace-users@archiver.kernel.org>; Mon, 13 Mar 2023 17:40:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjCMRkW (ORCPT
        <rfc822;linux-trace-users@archiver.kernel.org>);
        Mon, 13 Mar 2023 13:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjCMRkV (ORCPT
        <rfc822;linux-trace-users@vger.kernel.org>);
        Mon, 13 Mar 2023 13:40:21 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5007457F7
        for <linux-trace-users@vger.kernel.org>; Mon, 13 Mar 2023 10:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DMfle67UY2dm3cEE+4f9Ofklc/1RrlZldhXU5bzWeew=;
  b=hIs3WhaQ6W/x0aJ6u4hzNDdYFeMPhG4XpNA8rv3aoaGDPLXW5Yd9g2Wi
   k2uT/dIQvV4VgMosZKZB5RRqf8n0Hi5oga2K8LORXqB63Pt/fwcJsbdf0
   WgjibtTUvT/X/OzOcbTVQIPVOpzBjtnyJPOmn1FxsQ18/PPkKIUJuH14w
   o=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,257,1673910000"; 
   d="scan'208";a="96944243"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 18:40:16 +0100
Date:   Mon, 13 Mar 2023 18:40:16 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
To:     Steven Rostedt <rostedt@goodmis.org>
cc:     linux-trace-users@vger.kernel.org
Subject: Re: CSV output
In-Reply-To: <20230313121528.5650068b@gandalf.local.home>
Message-ID: <87b0589-28a5-1cb5-f3ee-4d5c2e817116@inria.fr>
References: <alpine.DEB.2.22.394.2303120805430.2865@hadrien> <20230313121528.5650068b@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-trace-users.vger.kernel.org>
X-Mailing-List: linux-trace-users@vger.kernel.org



On Mon, 13 Mar 2023, Steven Rostedt wrote:

> On Sun, 12 Mar 2023 08:07:01 +0100 (CET)
> Julia Lawall <julia.lawall@inria.fr> wrote:
>
> > Would it be possible with libtraceevent to get some kind of CSV output?
> > Ie something that is very easy or some other tool to parse, without having
> > to spend a lot of time removing spaces?
> >
>
> You mean to convert a trace.dat file into a csv output?
>
> I guess I don't know what you want to convert to CSV output.

Thanks for the patch.  But actually, I was hoping for something like this:

cpus=96
<...>-20420,074,3057.962369,sched_process_exec,/tmp/tmp2abf06.sh,20420,20420
<...>-20420,074,3057.963487,sched_switch,tmp2abf06.sh,20420,120,D,swapper/74,0,120
<idle>-0,034,3057.963602,sched_waking,kworker/u192,6,500,120,075
<idle>-0,075,3057.963632,sched_wakeup,kworker/u192,6,500,120,075
<idle>-0,075,3057.963637,sched_switch,swapper/75,0,120,R,kworker/u192,6,500,120
kworker/u192,6-500,075,3057.963656,sched_waking,tmp2abf06.sh,20420,120,074
kworker/u192,6-500,075,3057.963665,sched_switch,kworker/u192,6,500,120,W,swapper/75,0,120
<idle>-0,074,3057.963686,sched_wakeup,tmp2abf06.sh,20420,120,074
<idle>-0,074,3057.963691,sched_switch,swapper/74,0,120,R,tmp2abf06.sh,20420,120

It still remains human readable (more or less, with practice), but there
are not a lot of spaces that a parser has to get rid of.  The separator
character would have to be something that can't occur in a command name.

thanks,
julia



>
> I once made this, but never pushed it out.
>
> It adds "trace-cmd sqldump" where you pass it a trace.dat file and it
> returns an mysqldump formatted file, where each event is a table, its fields
> are columns, and the instances of the events are rows. This output (in
> theory, and use to work but I haven't tested it) allows you to pull in the
> trace.dat data into a mysql database.
>
> Is this something you are looking for? (I just forward ported it to the
> latest trace-cmd).
>
> -- Steve
>
>
> commit c78bbfa863b0d5ed9053945ebae87aa20ca5a1df
> Author: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Date:   Tue Jan 14 12:51:58 2020 -0500
>
>     trace-cmd: Add sqldump
>
>     TBD
>
>     Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>
> diff --git a/tracecmd/Makefile b/tracecmd/Makefile
> index 66387526bc4b..1a65d94196aa 100644
> --- a/tracecmd/Makefile
> +++ b/tracecmd/Makefile
> @@ -37,6 +37,7 @@ TRACE_CMD_OBJS += trace-dump.o
>  TRACE_CMD_OBJS += trace-clear.o
>  TRACE_CMD_OBJS += trace-vm.o
>  TRACE_CMD_OBJS += trace-convert.o
> +TRACE_CMD_OBJS += trace-sqldump.o
>  TRACE_CMD_OBJS += trace-agent.o
>  TRACE_CMD_OBJS += trace-tsync.o
>  TRACE_CMD_OBJS += trace-setup-guest.o
> diff --git a/tracecmd/include/trace-local.h b/tracecmd/include/trace-local.h
> index ae208fb6b593..1172c94fc52a 100644
> --- a/tracecmd/include/trace-local.h
> +++ b/tracecmd/include/trace-local.h
> @@ -126,6 +126,12 @@ int trace_record_agent(struct tracecmd_msg_handle *msg_handle,
>  		       bool use_fifos, struct tracecmd_time_sync *tsync,
>  		       unsigned long long trace_id, int rcid, const char *host);
>
> +int trace_sql_record(struct tracecmd_input *handle, struct tep_record *record);
> +
> +int trace_sql_init(struct tracecmd_input *handle);
> +
> +int trace_sql_finish(struct tracecmd_input *handle);
> +
>  struct hook_list;
>
>  void trace_init_profile(struct tracecmd_input *handle, struct hook_list *hooks,
> diff --git a/tracecmd/trace-cmd.c b/tracecmd/trace-cmd.c
> index 9646921ca268..8de506885948 100644
> --- a/tracecmd/trace-cmd.c
> +++ b/tracecmd/trace-cmd.c
> @@ -130,6 +130,7 @@ struct command {
>   */
>  struct command commands[] = {
>  	{"report", trace_report},
> +	{"sqldump", trace_report},
>  	{"snapshot", trace_snapshot},
>  	{"hist", trace_hist},
>  	{"mem", trace_mem},
> diff --git a/tracecmd/trace-read.c b/tracecmd/trace-read.c
> index 52ba818e13b6..9902c7b28212 100644
> --- a/tracecmd/trace-read.c
> +++ b/tracecmd/trace-read.c
> @@ -73,6 +73,10 @@ struct pid_list {
>  	int			free;
>  } *pid_list;
>
> +static const char *command;
> +
> +#define IS_SQLDUMP (strcmp(command, "sqldump") == 0)
> +
>  struct pid_list *comm_list;
>
>  static unsigned int page_size;
> @@ -1152,6 +1156,27 @@ static int process_record(struct tracecmd_input *handle, struct tep_record *reco
>  	return 0;
>  }
>
> +static int process_sql_record(struct tracecmd_input *handle, struct tep_record *record,
> +			  int cpu, void *data)
> +{
> +	struct handle_list *handles = tracecmd_get_private(handle);
> +	unsigned long long *last_timestamp = data;
> +
> +	if (skip_record(handles, record, cpu))
> +		return 0;
> +
> +	if (tscheck && *last_timestamp > record->ts) {
> +		errno = 0;
> +		warning("WARNING: Record on cpu %d went backwards: %lld to %lld delta: -%lld\n",
> +			cpu, *last_timestamp, record->ts, *last_timestamp - record->ts);
> +	}
> +	*last_timestamp = record->ts;
> +
> +	trace_sql_record(handle, record);
> +
> +	return 0;
> +}
> +
>  enum output_type {
>  	OUTPUT_NORMAL,
>  	OUTPUT_STAT_ONLY,
> @@ -1166,6 +1191,7 @@ static void read_data_info(struct list_head *handle_list, enum output_type otype
>  	struct handle_list *handles;
>  	struct tracecmd_input **handle_array;
>  	unsigned long long last_timestamp = 0;
> +	bool sqldump = IS_SQLDUMP;
>  	int nr_handles = 0;
>  	int first = 1;
>  	int ret;
> @@ -1196,7 +1222,8 @@ static void read_data_info(struct list_head *handle_list, enum output_type otype
>  			first = 0;
>  		}
>  		print_handle_file(handles);
> -		printf("cpus=%d\n", cpus);
> +		if (!sqldump)
> +			printf("cpus=%d\n", cpus);
>
>  		/* Latency trace is just all ASCII */
>  		if (ret > 0) {
> @@ -1222,13 +1249,15 @@ static void read_data_info(struct list_head *handle_list, enum output_type otype
>  			continue;
>  		}
>
> -		init_wakeup(handles->handle);
> -		if (last_hook)
> -			last_hook->next = tracecmd_hooks(handles->handle);
> -		else
> -			hooks = tracecmd_hooks(handles->handle);
> -		if (profile)
> -			trace_init_profile(handles->handle, hooks, global);
> +		if (!sqldump) {
> +			init_wakeup(handles->handle);
> +			if (last_hook)
> +				last_hook->next = tracecmd_hooks(handles->handle);
> +			else
> +				hooks = tracecmd_hooks(handles->handle);
> +			if (profile)
> +				trace_init_profile(handles->handle, hooks, global);
> +		}
>
>  		/* If this file has buffer instances, get the handles for them */
>  		instances = tracecmd_buffer_instances(handles->handle);
> @@ -1263,10 +1292,6 @@ static void read_data_info(struct list_head *handle_list, enum output_type otype
>  			}
>  		}
>  	}
> -
> -	if (otype != OUTPUT_NORMAL)
> -		return;
> -
>  	if (align_ts) {
>  		list_for_each_entry(handles, handle_list, list) {
>  			tracecmd_add_ts_offset(handles->handle, -first_ts);
> @@ -1285,8 +1310,25 @@ static void read_data_info(struct list_head *handle_list, enum output_type otype
>
>  	map_vcpus(handle_array, nr_handles);
>
> -	tracecmd_iterate_events_multi(handle_array, nr_handles,
> -				      process_record, &last_timestamp);
> +	if (sqldump) {
> +		struct tracecmd_input *handle;
> +		int i;
> +
> +		for (i = 0; i < nr_handles; i++) {
> +			handle = handle_array[i];
> +
> +			trace_sql_init(handle);
> +
> +			tracecmd_iterate_events(handle, NULL, 0,process_sql_record,
> +						&last_timestamp);
> +
> +			trace_sql_finish(handle);
> +		}
> +	} else {
> +
> +		tracecmd_iterate_events_multi(handle_array, nr_handles,
> +					      process_record, &last_timestamp);
> +	}
>
>  	free(handle_array);
>
> @@ -1559,9 +1601,12 @@ void trace_report (int argc, char **argv)
>  	if (argc < 2)
>  		usage(argv);
>
> -	if (strcmp(argv[1], "report") != 0)
> +	if ((strcmp(argv[1], "report") != 0) &&
> +	    (strcmp(argv[1], "sqldump") != 0))
>  		usage(argv);
>
> +	command = argv[1];
> +
>  	signal(SIGINT, sig_end);
>
>  	trace_set_loglevel(TEP_LOG_ERROR);
> @@ -1743,9 +1788,13 @@ void trace_report (int argc, char **argv)
>  			tracecmd_set_debug(true);
>  			break;
>  		case OPT_profile:
> +			if (IS_SQLDUMP)
> +				usage(argv);
>  			profile = 1;
>  			break;
>  		case OPT_uname:
> +			if (IS_SQLDUMP)
> +				usage(argv);
>  			show_uname = 1;
>  			break;
>  		case OPT_version:
> @@ -1965,6 +2014,10 @@ void trace_report (int argc, char **argv)
>  	/* and version overrides uname! */
>  	if (show_version)
>  		otype = OUTPUT_VERSION_ONLY;
> +
> +	if (IS_SQLDUMP && otype != OUTPUT_NORMAL)
> +		usage(argv);
> +
>  	read_data_info(&handle_list, otype, global, align_ts);
>
>  	list_for_each_entry(handles, &handle_list, list) {
> diff --git a/tracecmd/trace-sqldump.c b/tracecmd/trace-sqldump.c
> new file mode 100644
> index 000000000000..b7ce99d28642
> --- /dev/null
> +++ b/tracecmd/trace-sqldump.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 VMware Inc, Steven Rostedt
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <sys/types.h>
> +
> +#include "trace-cmd.h"
> +#include "trace-local.h"
> +
> +extern void breakpoint(void);
> +
> +struct event_table {
> +	struct tep_event	*event;
> +	struct tep_format_field **event_fields;
> +	int			*event_field_len;
> +	size_t			cnt;
> +	FILE			*fp;
> +};
> +
> +static struct tep_format_field **event_common_fields;
> +static int nr_event_common_fields;
> +
> +static struct event_table *event_table;
> +static int event_table_size;
> +
> +int trace_sql_init(struct tracecmd_input *handle)
> +{
> +	struct tep_handle *tep;
> +	struct tep_event **event_list;
> +	struct tep_event *event;
> +	struct event_table *et;
> +	unsigned int max_id = 0;
> +	int i, f;
> +
> +	tep = tracecmd_get_tep(handle);
> +	if (!tep)
> +		return -1;
> +
> +	event_list = tep_list_events(tep, TEP_EVENT_SORT_ID);
> +	if (!event_list)
> +		return -1;
> +
> +	for (i = 0; event_list[i]; i++) {
> +		event = event_list[i];
> +
> +		if (event->id > max_id)
> +			max_id = event->id;
> +	}
> +
> +	event_table = calloc(max_id + 1, sizeof(*event_table));
> +	event_table_size = max_id + 1;
> +
> +	for (i = 0; event_list[i]; i++) {
> +		int e;
> +
> +		event = event_list[i];
> +
> +		if (event->id == 302)
> +			breakpoint();
> +
> +		et = &event_table[event->id];
> +		et->event = event;
> +
> +		if (!event_common_fields) {
> +			event_common_fields = tep_event_common_fields(event);
> +			if (!event_common_fields)
> +				goto fail;
> +			for (f = 0; event_common_fields[f]; f++)
> +				;
> +			nr_event_common_fields = f + 1;
> +		}
> +
> +		et->event_fields = tep_event_fields(event);
> +		if (!et->event_fields)
> +			goto fail;
> +
> +		for (e = 0; et->event_fields[e]; e++)
> +			;
> +		et->event_field_len = calloc(e, sizeof(*et->event_field_len));
> +		if (!et->event_field_len)
> +			goto fail;
> +
> +		et->fp = tmpfile();
> +		if (!et->fp)
> +			goto fail;
> +	}
> +	return 0;
> + fail:
> +	die("done!\n");
> +	return -1;
> +}
> +
> +static void write_string(FILE *fp, const char *str, int len)
> +{
> +	if (!len)
> +		len = strlen(str);
> +
> +	fputc('\'', fp);
> +	fwrite(str, len, 1, fp);
> +	fputc('\'', fp);
> +}
> +
> +static void write_data(FILE *fp, struct tep_format_field *field,
> +		       struct tep_record *record, int *elen)
> +{
> +	struct tep_handle *tep = field->event->tep;
> +	unsigned int offset, len;
> +	unsigned long long val;
> +	char *data = record->data;
> +	char buffer[64];
> +
> +	if (field->flags & TEP_FIELD_IS_ARRAY) {
> +		offset = field->offset;
> +		len = field->size;
> +
> +		if (field->flags & TEP_FIELD_IS_DYNAMIC) {
> +			val = tep_read_number(tep, data + offset, len);
> +			offset = val;
> +			len = offset >> 16;
> +			offset &= 0xffff;
> +		}
> +		if (field->flags & TEP_FIELD_IS_STRING) {
> +			int l = strlen(data + offset);
> +
> +			if (l < len)
> +				len = l;
> +			write_string(fp, data + offset, len);
> +		} else {
> +			write_string(fp, "ARRAY", 0);
> +			len = 5;
> +		}
> +		if (elen && (*elen) < len)
> +			*elen = len;
> +		return;
> +	}
> +	val = tep_read_number(tep, data + field->offset,
> +			      field->size);
> +	sprintf(buffer, "%lld", val);
> +	fwrite(buffer, strlen(buffer), 1, fp);
> +
> +}
> +
> +int trace_sql_record(struct tracecmd_input *handle, struct tep_record *record)
> +{
> +	struct tep_handle *tep = tracecmd_get_tep(handle);
> +	struct tep_event *event = tep_find_event_by_record(tep, record);
> +	struct event_table *et = &event_table[event->id];
> +	char buffer[64];
> +	int i;
> +
> +	if (event->id > event_table_size || !et->event)
> +		return -1;
> +
> +	if (event->id == 302)
> +		breakpoint();
> +
> +	if (et->cnt++)
> +		fwrite(",(", 2, 1, et->fp);
> +	else
> +		fwrite("(", 1, 1, et->fp);
> +
> +	i = sprintf(buffer, "%lld", record->ts);
> +	fwrite(buffer, i, 1, et->fp);
> +
> +	for (i = 0; event_common_fields[i]; i++) {
> +		fwrite(",", 1, 1, et->fp);
> +		write_data(et->fp, event_common_fields[i], record, NULL);
> +	}
> +
> +	for (i = 0; et->event_fields[i]; i++) {
> +		fwrite(",", 1, 1, et->fp);
> +		write_data(et->fp, et->event_fields[i], record,
> +			   &et->event_field_len[i]);
> +	}
> +
> +	fwrite(")", 1, 1, et->fp);
> +
> +	return 0;
> +}
> +
> +static void write_header(struct tep_format_field *field, int flen)
> +{
> +
> +	printf("`%s` ", field->name);
> +
> +	if (field->flags & TEP_FIELD_IS_ARRAY) {
> +		if (field->flags & TEP_FIELD_IS_STRING) {
> +			if (field->flags & TEP_FIELD_IS_DYNAMIC) {
> +				if (flen)
> +					printf("VARCHAR(%d)", flen);
> +				else
> +					printf("VARCHAR(64)");
> +			} else {
> +				printf("CHAR(%d)", field->size);
> +			}
> +		} else {
> +			printf("CHAR(5)");
> +		}
> +	} else {
> +		printf("BIGINT");
> +	}
> +
> +	printf(" NOT NULL");
> +}
> +
> +static void print_sql_header(struct event_table *et)
> +{
> +	const char *name = et->event->name;
> +	int i;
> +
> +	printf("\n---\n--- Table structure for table `%s`\n---\n\n", name);
> +	printf("DROP TABLE IF EXISTS `%s`;\n", name);
> +
> +	printf("CREATE TABLE `%s` (\n", name);
> +
> +	printf("  `common_timestamp` BIGINT NOT NULL");
> +
> +	for (i = 0; event_common_fields[i]; i++) {
> +		printf(",\n  ");
> +		write_header(event_common_fields[i], 0);
> +	}
> +
> +	for (i = 0; et->event_fields[i]; i++) {
> +		printf(",\n  ");
> +		write_header(et->event_fields[i], et->event_field_len[i]);
> +	}
> +
> +	printf("\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\n");
> +	printf("\n---\n--- Dumping data for table `%s`\n---\n\n", name);
> +	printf("LOCK TABLES `%s` WRITE;\n", name);
> +	printf("INSERT INTO `%s` VALUES ", name);
> +
> +	fflush(stdout);
> +	fflush(et->fp);
> +}
> +
> +int trace_sql_finish(struct tracecmd_input *handle)
> +{
> +	struct event_table *et;
> +	char buffer[BUFSIZ];
> +	int i, r;
> +	int fd;
> +
> +	for (i = 0; i < event_table_size; i++) {
> +		et = &event_table[i];
> +		if (!et->cnt)
> +			continue;
> +
> +		print_sql_header(et);
> +
> +		fd = fileno(et->fp);
> +		lseek(fd, 0, SEEK_SET);
> +		do {
> +			r = read(fd, buffer, BUFSIZ);
> +			if (r > 0)
> +				write(1, buffer, r);
> +		} while (r > 0);
> +		fclose(et->fp);
> +		printf(";\n");
> +		printf("UNLOCK TABLES;\n");
> +	}
> +
> +	return 0;
> +}
>
